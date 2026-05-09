; DESCRIPTION: Creates a orange rectangular region at (176, 122) spanning 101 by 43 pixels.
; PLAN: r0=176(x), r1=122(y), r2=101(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 122
LDI r2, 101
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
