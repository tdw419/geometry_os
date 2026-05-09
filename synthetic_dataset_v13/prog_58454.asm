; DESCRIPTION: Creates a orange rectangular region at (93, 29) spanning 66 by 61 pixels.
; PLAN: r0=93(x), r1=29(y), r2=66(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 29
LDI r2, 66
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
