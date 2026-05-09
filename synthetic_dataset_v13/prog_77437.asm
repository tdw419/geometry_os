; DESCRIPTION: Composite: Places a purple circle of radius 18 at center (114, 218) then Creates a orange rectangular region at (164, 118) spanning 120 by 69 pixels.
; PLAN: r0=114(x), r1=218(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=118(y), r7=120(width), r8=69(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 218
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 118
LDI r7, 120
LDI r8, 69
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
