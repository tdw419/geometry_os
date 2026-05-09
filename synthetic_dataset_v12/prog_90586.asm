; DESCRIPTION: Creates a orange rectangular region at (338, 11) spanning 69 by 102 pixels.
; PLAN: r0=338(x), r1=11(y), r2=69(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 11
LDI r2, 69
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
