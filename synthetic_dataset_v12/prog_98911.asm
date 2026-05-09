; DESCRIPTION: Composite: Places a magenta 16x54 rectangle at position (213, 53) then Renders a blue line between points (438, 48) and (168, 161) then Creates a yellow circular shape at (222, 100) with radius 67.
; PLAN: r0=213(x), r1=53(y), r2=16(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=48(y1), r7=168(x2), r8=161(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=100(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 53
LDI r2, 16
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 48
LDI r7, 168
LDI r8, 161
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 100
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
