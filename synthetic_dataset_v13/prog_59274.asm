; DESCRIPTION: Composite: Sets a single yellow pixel at (414, 109) then Draws a red line from (217, 33) to (113, 128).
; PLAN: r0=414(x), r1=109(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=33(y1), r7=113(x2), r8=128(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 109
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 217
LDI r6, 33
LDI r7, 113
LDI r8, 128
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
