; DESCRIPTION: Creates a red rectangular region at (257, 82) spanning 76 by 105 pixels.
; PLAN: r0=257(x), r1=82(y), r2=76(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 82
LDI r2, 76
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
