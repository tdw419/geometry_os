; DESCRIPTION: Composite: Creates a green rectangular region at (263, 195) spanning 95 by 21 pixels then Places a green line segment connecting (419, 12) to (118, 52) then Renders a orange disk with center (144, 105) and radius 64.
; PLAN: r0=263(x), r1=195(y), r2=95(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=12(y1), r7=118(x2), r8=52(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=144(x), r11=105(y), r12=64(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 195
LDI r2, 95
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 12
LDI r7, 118
LDI r8, 52
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 105
LDI r12, 64
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
