; DESCRIPTION: Composite: Draws a white line from (373, 94) to (97, 219) then Renders a purple disk with center (291, 73) and radius 30.
; PLAN: r0=373(x1), r1=94(y1), r2=97(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=73(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 94
LDI r2, 97
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 73
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
