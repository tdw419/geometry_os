; DESCRIPTION: Composite: Sets a single purple pixel at (451, 216) then Places a magenta circle of radius 22 at center (124, 113) then Renders a orange box of size 76x78 starting at (143, 110).
; PLAN: r0=451(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=113(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=110(y), r12=76(width), r13=78(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 216
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 113
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 110
LDI r12, 76
LDI r13, 78
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
