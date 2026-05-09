; DESCRIPTION: Creates a orange rectangular region at (471, 172) spanning 11 by 69 pixels.
; PLAN: r0=471(x), r1=172(y), r2=11(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 172
LDI r2, 11
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
