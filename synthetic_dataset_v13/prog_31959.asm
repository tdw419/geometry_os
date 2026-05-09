; DESCRIPTION: Composite: Creates a black rectangular region at (85, 77) spanning 53 by 39 pixels then Places a blue circle of radius 20 at center (149, 55).
; PLAN: r0=85(x), r1=77(y), r2=53(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=55(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 77
LDI r2, 53
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 55
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
