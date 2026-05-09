; DESCRIPTION: Creates a orange rectangular region at (326, 42) spanning 101 by 89 pixels.
; PLAN: r0=326(x), r1=42(y), r2=101(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 42
LDI r2, 101
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
