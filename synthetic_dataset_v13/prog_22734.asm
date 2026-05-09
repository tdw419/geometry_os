; DESCRIPTION: Creates a orange rectangular region at (62, 49) spanning 61 by 82 pixels.
; PLAN: r0=62(x), r1=49(y), r2=61(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 49
LDI r2, 61
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
