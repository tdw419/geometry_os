; DESCRIPTION: Composite: Creates a orange rectangular region at (87, 117) spanning 86 by 80 pixels then Places a purple circle of radius 25 at center (318, 103).
; PLAN: r0=87(x), r1=117(y), r2=86(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=103(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 117
LDI r2, 86
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 103
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
