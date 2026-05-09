; DESCRIPTION: Creates a orange rectangular region at (9, 159) spanning 69 by 24 pixels.
; PLAN: r0=9(x), r1=159(y), r2=69(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 159
LDI r2, 69
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
