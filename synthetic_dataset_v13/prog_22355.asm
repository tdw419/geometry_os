; DESCRIPTION: Composite: Places a white circle of radius 63 at center (419, 122) then Draws a purple line from (289, 156) to (86, 254).
; PLAN: r0=419(x), r1=122(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x1), r6=156(y1), r7=86(x2), r8=254(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 122
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 156
LDI r7, 86
LDI r8, 254
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
