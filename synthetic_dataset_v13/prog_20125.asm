; DESCRIPTION: Creates a orange rectangular region at (227, 65) spanning 66 by 15 pixels.
; PLAN: r0=227(x), r1=65(y), r2=66(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 65
LDI r2, 66
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
