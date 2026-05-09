; DESCRIPTION: Composite: Draws a blue line from (285, 243) to (64, 195) then Renders a blue box of size 75x113 starting at (416, 19) then Draws a purple circle centered at (311, 158) with radius 10.
; PLAN: r0=285(x1), r1=243(y1), r2=64(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=19(y), r7=75(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=158(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 243
LDI r2, 64
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 19
LDI r7, 75
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 158
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
