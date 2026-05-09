; DESCRIPTION: Composite: Renders a blue line between points (131, 246) and (96, 232) then Creates a purple rectangular region at (319, 176) spanning 44 by 20 pixels then Creates a cyan circular shape at (69, 120) with radius 58.
; PLAN: r0=131(x1), r1=246(y1), r2=96(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=176(y), r7=44(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=120(y), r12=58(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 246
LDI r2, 96
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 176
LDI r7, 44
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 120
LDI r12, 58
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
