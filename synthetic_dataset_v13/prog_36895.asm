; DESCRIPTION: Composite: Draws a magenta circle centered at (392, 101) with radius 77 then Draws a orange rectangle at (285, 35) with width 77 and height 34 then Renders a black line between points (127, 32) and (41, 16).
; PLAN: r0=392(x), r1=101(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=35(y), r7=77(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x1), r11=32(y1), r12=41(x2), r13=16(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 101
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 35
LDI r7, 77
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 32
LDI r12, 41
LDI r13, 16
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
