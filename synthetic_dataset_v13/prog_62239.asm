; DESCRIPTION: Creates a orange rectangular region at (182, 97) spanning 69 by 75 pixels.
; PLAN: r0=182(x), r1=97(y), r2=69(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 97
LDI r2, 69
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
