; DESCRIPTION: Composite: Renders a red box of size 38x67 starting at (273, 78) then Places a blue dot at position (270, 195) then Places a purple circle of radius 78 at center (285, 149).
; PLAN: r0=273(x), r1=78(y), r2=38(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=195(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=285(x), r11=149(y), r12=78(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 78
LDI r2, 38
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 195
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 285
LDI r11, 149
LDI r12, 78
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
