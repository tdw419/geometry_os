; DESCRIPTION: Composite: Renders a purple box of size 71x34 starting at (219, 111) then Sets a single purple pixel at (160, 105) then Renders a blue disk with center (160, 65) and radius 56.
; PLAN: r0=219(x), r1=111(y), r2=71(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=105(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=65(y), r12=56(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 219
LDI r1, 111
LDI r2, 71
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 105
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 160
LDI r11, 65
LDI r12, 56
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
