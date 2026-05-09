; DESCRIPTION: Composite: Sets a single white pixel at (459, 130) then Renders a purple line between points (185, 39) and (247, 141) then Renders a blue disk with center (310, 180) and radius 38.
; PLAN: r0=459(x), r1=130(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=39(y1), r7=247(x2), r8=141(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=180(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 130
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 185
LDI r6, 39
LDI r7, 247
LDI r8, 141
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 180
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
