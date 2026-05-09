; DESCRIPTION: Creates a orange rectangular region at (101, 38) spanning 53 by 98 pixels.
; PLAN: r0=101(x), r1=38(y), r2=53(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 38
LDI r2, 53
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
