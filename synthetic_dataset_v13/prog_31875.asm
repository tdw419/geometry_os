; DESCRIPTION: Composite: Places a yellow line segment connecting (111, 8) to (439, 81) then Sets a single green pixel at (425, 61).
; PLAN: r0=111(x1), r1=8(y1), r2=439(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 8
LDI r2, 439
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
