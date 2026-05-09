; DESCRIPTION: Creates a black rectangular region at (257, 34) spanning 33 by 85 pixels.
; PLAN: r0=257(x), r1=34(y), r2=33(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 34
LDI r2, 33
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
