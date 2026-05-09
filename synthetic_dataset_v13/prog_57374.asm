; DESCRIPTION: Creates a orange rectangular region at (31, 97) spanning 48 by 23 pixels.
; PLAN: r0=31(x), r1=97(y), r2=48(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 97
LDI r2, 48
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
