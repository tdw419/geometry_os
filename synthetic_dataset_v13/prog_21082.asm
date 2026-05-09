; DESCRIPTION: Composite: Draws a blue line from (17, 213) to (402, 250) then Creates a purple rectangular region at (311, 67) spanning 16 by 100 pixels then Draws a cyan circle centered at (154, 149) with radius 12.
; PLAN: r0=17(x1), r1=213(y1), r2=402(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=67(y), r7=16(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=149(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 17
LDI r1, 213
LDI r2, 402
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 67
LDI r7, 16
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 149
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
