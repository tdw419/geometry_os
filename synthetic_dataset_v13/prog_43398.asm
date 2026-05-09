; DESCRIPTION: Creates a orange rectangular region at (53, 62) spanning 69 by 48 pixels.
; PLAN: r0=53(x), r1=62(y), r2=69(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 62
LDI r2, 69
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
