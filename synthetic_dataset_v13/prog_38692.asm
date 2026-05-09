; DESCRIPTION: Composite: Draws a orange line from (110, 210) to (268, 35) then Draws a magenta circle centered at (155, 127) with radius 51 then Draws a white rectangle at (313, 59) with width 60 and height 38.
; PLAN: r0=110(x1), r1=210(y1), r2=268(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=127(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=59(y), r12=60(width), r13=38(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 210
LDI r2, 268
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 127
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 59
LDI r12, 60
LDI r13, 38
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
