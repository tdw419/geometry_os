; DESCRIPTION: Creates a orange rectangular region at (343, 42) spanning 90 by 49 pixels.
; PLAN: r0=343(x), r1=42(y), r2=90(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 42
LDI r2, 90
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
