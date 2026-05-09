; DESCRIPTION: Creates a orange rectangular region at (452, 53) spanning 33 by 35 pixels.
; PLAN: r0=452(x), r1=53(y), r2=33(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 53
LDI r2, 33
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
