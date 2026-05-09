; DESCRIPTION: Composite: Places a yellow line segment connecting (94, 106) to (1, 59) then Creates a red rectangular region at (66, 107) spanning 79 by 23 pixels then Renders a magenta disk with center (310, 65) and radius 19.
; PLAN: r0=94(x1), r1=106(y1), r2=1(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=107(y), r7=79(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=65(y), r12=19(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 106
LDI r2, 1
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 107
LDI r7, 79
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 65
LDI r12, 19
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
