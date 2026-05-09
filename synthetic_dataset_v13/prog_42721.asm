; DESCRIPTION: Creates a orange rectangular region at (356, 43) spanning 114 by 69 pixels.
; PLAN: r0=356(x), r1=43(y), r2=114(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 43
LDI r2, 114
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
