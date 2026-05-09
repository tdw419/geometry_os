; DESCRIPTION: Creates a orange rectangular region at (213, 68) spanning 18 by 97 pixels.
; PLAN: r0=213(x), r1=68(y), r2=18(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 68
LDI r2, 18
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
