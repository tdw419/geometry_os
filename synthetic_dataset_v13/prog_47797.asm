; DESCRIPTION: Composite: Draws a red circle centered at (457, 76) with radius 51 then Sets a single black pixel at (295, 241) then Renders a orange box of size 40x46 starting at (423, 60).
; PLAN: r0=457(x), r1=76(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=241(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=60(y), r12=40(width), r13=46(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 76
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 241
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 423
LDI r11, 60
LDI r12, 40
LDI r13, 46
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
