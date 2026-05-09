; DESCRIPTION: Composite: Creates a magenta rectangular region at (435, 114) spanning 69 by 88 pixels then Draws a yellow line from (238, 155) to (381, 136).
; PLAN: r0=435(x), r1=114(y), r2=69(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=155(y1), r7=381(x2), r8=136(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 114
LDI r2, 69
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 155
LDI r7, 381
LDI r8, 136
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
