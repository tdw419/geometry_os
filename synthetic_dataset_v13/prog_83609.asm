; DESCRIPTION: Composite: Draws a orange circle centered at (305, 92) with radius 35 then Sets a single orange pixel at (291, 102) then Renders a blue box of size 110x113 starting at (306, 70).
; PLAN: r0=305(x), r1=92(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=102(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=70(y), r12=110(width), r13=113(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 92
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 102
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 306
LDI r11, 70
LDI r12, 110
LDI r13, 113
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
