; DESCRIPTION: Creates a orange rectangular region at (219, 126) spanning 60 by 53 pixels.
; PLAN: r0=219(x), r1=126(y), r2=60(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 126
LDI r2, 60
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
