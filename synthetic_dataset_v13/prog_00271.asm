; DESCRIPTION: Composite: Renders a cyan line between points (208, 90) and (442, 12) then Creates a blue rectangular region at (17, 144) spanning 54 by 30 pixels then Creates a orange circular shape at (148, 172) with radius 10.
; PLAN: r0=208(x1), r1=90(y1), r2=442(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=144(y), r7=54(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x), r11=172(y), r12=10(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 208
LDI r1, 90
LDI r2, 442
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 144
LDI r7, 54
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 172
LDI r12, 10
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
