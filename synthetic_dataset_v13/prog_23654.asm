; DESCRIPTION: Composite: Creates a magenta rectangular region at (169, 76) spanning 35 by 12 pixels then Places a blue line segment connecting (123, 230) to (190, 105).
; PLAN: r0=169(x), r1=76(y), r2=35(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=230(y1), r7=190(x2), r8=105(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 76
LDI r2, 35
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 230
LDI r7, 190
LDI r8, 105
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
