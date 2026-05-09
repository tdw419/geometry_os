; DESCRIPTION: Creates a orange rectangular region at (69, 19) spanning 27 by 97 pixels.
; PLAN: r0=69(x), r1=19(y), r2=27(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 19
LDI r2, 27
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
