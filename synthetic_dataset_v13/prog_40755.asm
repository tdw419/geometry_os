; DESCRIPTION: Composite: Creates a cyan rectangular region at (311, 123) spanning 104 by 14 pixels then Draws a green line from (492, 22) to (337, 251) then Renders a red disk with center (203, 105) and radius 56.
; PLAN: r0=311(x), r1=123(y), r2=104(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=22(y1), r7=337(x2), r8=251(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=105(y), r12=56(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 311
LDI r1, 123
LDI r2, 104
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 22
LDI r7, 337
LDI r8, 251
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 105
LDI r12, 56
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
