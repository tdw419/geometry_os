; DESCRIPTION: Composite: Draws a orange line from (494, 138) to (330, 162) then Places a blue circle of radius 59 at center (245, 105) then Places a magenta 55x75 rectangle at position (379, 33).
; PLAN: r0=494(x1), r1=138(y1), r2=330(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=105(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x), r11=33(y), r12=55(width), r13=75(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 138
LDI r2, 330
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 105
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 33
LDI r12, 55
LDI r13, 75
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
