; DESCRIPTION: Composite: Draws a magenta rectangle at (191, 231) with width 110 and height 23 then Draws a red circle centered at (367, 140) with radius 68 then Draws a blue line from (81, 32) to (40, 210).
; PLAN: r0=191(x), r1=231(y), r2=110(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=140(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x1), r11=32(y1), r12=40(x2), r13=210(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 231
LDI r2, 110
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 140
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 32
LDI r12, 40
LDI r13, 210
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
