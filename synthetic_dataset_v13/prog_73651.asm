; DESCRIPTION: Composite: Creates a black rectangular region at (301, 48) spanning 109 by 50 pixels then Places a red line segment connecting (220, 22) to (385, 211) then Renders a green disk with center (158, 126) and radius 40.
; PLAN: r0=301(x), r1=48(y), r2=109(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x1), r6=22(y1), r7=385(x2), r8=211(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=126(y), r12=40(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 48
LDI r2, 109
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 22
LDI r7, 385
LDI r8, 211
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 126
LDI r12, 40
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
