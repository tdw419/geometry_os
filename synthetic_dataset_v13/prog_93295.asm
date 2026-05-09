; DESCRIPTION: Creates a orange rectangular region at (77, 176) spanning 64 by 53 pixels.
; PLAN: r0=77(x), r1=176(y), r2=64(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 176
LDI r2, 64
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
