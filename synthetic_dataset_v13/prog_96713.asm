; DESCRIPTION: Composite: Renders a red box of size 17x19 starting at (200, 143) then Places a black line segment connecting (226, 130) to (24, 214) then Places a blue dot at position (289, 105).
; PLAN: r0=200(x), r1=143(y), r2=17(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x1), r6=130(y1), r7=24(x2), r8=214(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=105(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 143
LDI r2, 17
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 130
LDI r7, 24
LDI r8, 214
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 105
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
