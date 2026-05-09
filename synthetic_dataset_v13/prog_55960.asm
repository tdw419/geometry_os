; DESCRIPTION: Composite: Renders a red box of size 89x43 starting at (348, 62) then Sets a single black pixel at (338, 57) then Draws a green circle centered at (374, 109) with radius 45.
; PLAN: r0=348(x), r1=62(y), r2=89(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=57(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=374(x), r11=109(y), r12=45(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 62
LDI r2, 89
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 57
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 374
LDI r11, 109
LDI r12, 45
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
