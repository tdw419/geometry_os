; DESCRIPTION: Creates a orange rectangular region at (257, 193) spanning 103 by 32 pixels.
; PLAN: r0=257(x), r1=193(y), r2=103(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 193
LDI r2, 103
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
