; DESCRIPTION: Creates a orange rectangular region at (452, 69) spanning 45 by 28 pixels.
; PLAN: r0=452(x), r1=69(y), r2=45(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 69
LDI r2, 45
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
