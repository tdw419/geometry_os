; DESCRIPTION: Creates a orange rectangular region at (18, 39) spanning 53 by 118 pixels.
; PLAN: r0=18(x), r1=39(y), r2=53(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 39
LDI r2, 53
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
