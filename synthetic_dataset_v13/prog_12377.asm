; DESCRIPTION: Composite: Creates a magenta circular shape at (453, 69) with radius 35 then Draws a green line from (302, 20) to (314, 95) then Draws a white rectangle at (259, 127) with width 59 and height 58.
; PLAN: r0=453(x), r1=69(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=20(y1), r7=314(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=127(y), r12=59(width), r13=58(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 69
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 20
LDI r7, 314
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 127
LDI r12, 59
LDI r13, 58
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
