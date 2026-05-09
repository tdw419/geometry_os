; DESCRIPTION: Composite: Places a black 17x76 rectangle at position (348, 23) then Sets a single blue pixel at (503, 217) then Places a orange circle of radius 59 at center (395, 135).
; PLAN: r0=348(x), r1=23(y), r2=17(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x), r6=217(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=395(x), r11=135(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 23
LDI r2, 17
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 217
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 395
LDI r11, 135
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
