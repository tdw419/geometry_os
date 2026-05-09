; DESCRIPTION: Creates a white rectangular region at (397, 179) spanning 85 by 11 pixels.
; PLAN: r0=397(x), r1=179(y), r2=85(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 179
LDI r2, 85
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
