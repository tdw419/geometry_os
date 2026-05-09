; DESCRIPTION: Composite: Renders a orange box of size 69x29 starting at (19, 39) then Renders a green line between points (71, 198) and (165, 6) then Draws a white circle centered at (267, 193) with radius 54.
; PLAN: r0=19(x), r1=39(y), r2=69(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x1), r6=198(y1), r7=165(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=193(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 39
LDI r2, 69
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 198
LDI r7, 165
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 193
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
