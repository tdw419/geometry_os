; DESCRIPTION: Composite: Creates a orange rectangular region at (390, 136) spanning 62 by 33 pixels then Renders a white disk with center (360, 144) and radius 37 then Places a red line segment connecting (280, 60) to (242, 31).
; PLAN: r0=390(x), r1=136(y), r2=62(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=144(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x1), r11=60(y1), r12=242(x2), r13=31(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 136
LDI r2, 62
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 144
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 60
LDI r12, 242
LDI r13, 31
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
