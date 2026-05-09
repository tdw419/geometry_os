; DESCRIPTION: Creates a black rectangular region at (257, 181) spanning 85 by 24 pixels.
; PLAN: r0=257(x), r1=181(y), r2=85(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 181
LDI r2, 85
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
