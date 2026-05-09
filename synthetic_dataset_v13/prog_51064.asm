; DESCRIPTION: Composite: Creates a green rectangular region at (288, 129) spanning 49 by 60 pixels then Creates a orange circular shape at (93, 133) with radius 79.
; PLAN: r0=288(x), r1=129(y), r2=49(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=133(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 129
LDI r2, 49
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 133
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
