; DESCRIPTION: Creates a orange rectangular region at (411, 122) spanning 83 by 53 pixels.
; PLAN: r0=411(x), r1=122(y), r2=83(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 122
LDI r2, 83
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
