; DESCRIPTION: Composite: Sets a single red pixel at (414, 61) then Draws a yellow line from (464, 103) to (64, 49).
; PLAN: r0=414(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=103(y1), r7=64(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 464
LDI r6, 103
LDI r7, 64
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
