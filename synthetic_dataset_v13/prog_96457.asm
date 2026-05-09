; DESCRIPTION: Composite: Creates a white rectangular region at (131, 117) spanning 85 by 99 pixels then Places a orange circle of radius 68 at center (383, 131).
; PLAN: r0=131(x), r1=117(y), r2=85(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=131(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 117
LDI r2, 85
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 131
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
