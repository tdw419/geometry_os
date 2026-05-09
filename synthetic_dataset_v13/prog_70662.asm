; DESCRIPTION: Creates a orange rectangular region at (31, 195) spanning 99 by 35 pixels.
; PLAN: r0=31(x), r1=195(y), r2=99(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 195
LDI r2, 99
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
