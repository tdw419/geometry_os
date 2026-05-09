; DESCRIPTION: Composite: Draws a red circle centered at (464, 140) with radius 46 then Draws a cyan rectangle at (332, 158) with width 56 and height 67 then Places a magenta line segment connecting (413, 198) to (128, 231).
; PLAN: r0=464(x), r1=140(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=158(y), r7=56(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x1), r11=198(y1), r12=128(x2), r13=231(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 140
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 158
LDI r7, 56
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 198
LDI r12, 128
LDI r13, 231
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
