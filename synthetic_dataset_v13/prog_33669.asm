; DESCRIPTION: Composite: Draws a orange circle centered at (125, 96) with radius 76 then Sets a single black pixel at (468, 58) then Renders a red box of size 112x20 starting at (212, 113).
; PLAN: r0=125(x), r1=96(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=58(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=113(y), r12=112(width), r13=20(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 96
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 58
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 212
LDI r11, 113
LDI r12, 112
LDI r13, 20
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
