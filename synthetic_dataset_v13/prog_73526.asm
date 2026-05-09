; DESCRIPTION: Composite: Renders a purple box of size 110x111 starting at (35, 57) then Places a orange circle of radius 15 at center (474, 123) then Sets a single purple pixel at (495, 16).
; PLAN: r0=35(x), r1=57(y), r2=110(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=123(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x), r11=16(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 57
LDI r2, 110
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 123
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 16
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
