; DESCRIPTION: Composite: Places a magenta line segment connecting (85, 219) to (474, 127) then Renders a cyan box of size 101x51 starting at (23, 205) then Draws a blue circle centered at (259, 62) with radius 57.
; PLAN: r0=85(x1), r1=219(y1), r2=474(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=205(y), r7=101(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=62(y), r12=57(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 219
LDI r2, 474
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 205
LDI r7, 101
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 62
LDI r12, 57
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
