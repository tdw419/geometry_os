; DESCRIPTION: Creates a orange rectangular region at (466, 43) spanning 35 by 43 pixels.
; PLAN: r0=466(x), r1=43(y), r2=35(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 43
LDI r2, 35
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
