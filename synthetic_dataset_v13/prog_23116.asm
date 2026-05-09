; DESCRIPTION: Composite: Places a magenta line segment connecting (86, 234) to (250, 234) then Renders a blue box of size 69x97 starting at (46, 13) then Renders a green disk with center (425, 140) and radius 65.
; PLAN: r0=86(x1), r1=234(y1), r2=250(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=13(y), r7=69(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=140(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 234
LDI r2, 250
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 13
LDI r7, 69
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 140
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
