; DESCRIPTION: Composite: Places a blue line segment connecting (438, 11) to (283, 60) then Renders a yellow box of size 29x103 starting at (20, 128) then Renders a magenta disk with center (268, 111) and radius 43.
; PLAN: r0=438(x1), r1=11(y1), r2=283(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=128(y), r7=29(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=111(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 438
LDI r1, 11
LDI r2, 283
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 128
LDI r7, 29
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 111
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
