; DESCRIPTION: Composite: Draws a purple line from (429, 30) to (289, 217) then Places a black circle of radius 77 at center (275, 106).
; PLAN: r0=429(x1), r1=30(y1), r2=289(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=106(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 30
LDI r2, 289
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 106
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
