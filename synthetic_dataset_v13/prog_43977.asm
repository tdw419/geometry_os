; DESCRIPTION: Creates a orange rectangular region at (334, 42) spanning 67 by 119 pixels.
; PLAN: r0=334(x), r1=42(y), r2=67(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 42
LDI r2, 67
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
