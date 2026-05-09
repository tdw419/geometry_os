; DESCRIPTION: Composite: Draws a magenta circle centered at (416, 96) with radius 23 then Renders a black line between points (166, 94) and (507, 112) then Creates a cyan rectangular region at (59, 7) spanning 108 by 13 pixels.
; PLAN: r0=416(x), r1=96(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x1), r6=94(y1), r7=507(x2), r8=112(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=7(y), r12=108(width), r13=13(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 96
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 94
LDI r7, 507
LDI r8, 112
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 7
LDI r12, 108
LDI r13, 13
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
