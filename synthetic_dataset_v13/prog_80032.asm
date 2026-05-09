; DESCRIPTION: Composite: Creates a blue rectangular region at (194, 100) spanning 45 by 88 pixels then Renders a green disk with center (40, 60) and radius 16 then Places a orange line segment connecting (275, 75) to (348, 31).
; PLAN: r0=194(x), r1=100(y), r2=45(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=60(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=275(x1), r11=75(y1), r12=348(x2), r13=31(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 100
LDI r2, 45
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 60
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 275
LDI r11, 75
LDI r12, 348
LDI r13, 31
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
