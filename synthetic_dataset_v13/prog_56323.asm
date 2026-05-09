; DESCRIPTION: Creates a orange rectangular region at (35, 12) spanning 108 by 62 pixels.
; PLAN: r0=35(x), r1=12(y), r2=108(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 12
LDI r2, 108
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
