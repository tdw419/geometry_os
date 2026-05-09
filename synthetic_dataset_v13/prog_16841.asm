; DESCRIPTION: Composite: Draws a magenta line from (465, 218) to (271, 192) then Renders a green disk with center (313, 113) and radius 15 then Draws a yellow rectangle at (199, 226) with width 69 and height 22.
; PLAN: r0=465(x1), r1=218(y1), r2=271(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=113(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x), r11=226(y), r12=69(width), r13=22(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 218
LDI r2, 271
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 113
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 226
LDI r12, 69
LDI r13, 22
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
