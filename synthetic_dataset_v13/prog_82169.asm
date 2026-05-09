; DESCRIPTION: Composite: Creates a orange rectangular region at (321, 60) spanning 84 by 59 pixels then Creates a blue circular shape at (317, 133) with radius 18.
; PLAN: r0=321(x), r1=60(y), r2=84(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=133(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 321
LDI r1, 60
LDI r2, 84
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 133
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
