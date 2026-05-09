; DESCRIPTION: Creates a black rectangular region at (257, 218) spanning 120 by 30 pixels.
; PLAN: r0=257(x), r1=218(y), r2=120(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 218
LDI r2, 120
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
