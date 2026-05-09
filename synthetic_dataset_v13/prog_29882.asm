; DESCRIPTION: Composite: Creates a blue rectangular region at (132, 119) spanning 89 by 62 pixels then Places a orange circle of radius 52 at center (433, 183).
; PLAN: r0=132(x), r1=119(y), r2=89(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=183(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 119
LDI r2, 89
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 183
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
