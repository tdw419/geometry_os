; DESCRIPTION: Composite: Creates a red rectangular region at (462, 110) spanning 45 by 96 pixels then Draws a white line from (174, 151) to (451, 149) then Renders a blue disk with center (253, 169) and radius 51.
; PLAN: r0=462(x), r1=110(y), r2=45(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x1), r6=151(y1), r7=451(x2), r8=149(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=169(y), r12=51(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 462
LDI r1, 110
LDI r2, 45
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 151
LDI r7, 451
LDI r8, 149
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 169
LDI r12, 51
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
