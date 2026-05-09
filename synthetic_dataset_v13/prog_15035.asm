; DESCRIPTION: Composite: Places a orange line segment connecting (8, 154) to (338, 208) then Sets a single white pixel at (341, 191).
; PLAN: r0=8(x1), r1=154(y1), r2=338(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=191(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 154
LDI r2, 338
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 191
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
