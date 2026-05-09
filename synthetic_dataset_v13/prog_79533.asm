; DESCRIPTION: Composite: Places a purple line segment connecting (327, 30) to (378, 209) then Creates a white circular shape at (420, 86) with radius 71.
; PLAN: r0=327(x1), r1=30(y1), r2=378(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=86(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 30
LDI r2, 378
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 86
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
