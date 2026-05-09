; DESCRIPTION: Creates a orange rectangular region at (195, 66) spanning 31 by 49 pixels.
; PLAN: r0=195(x), r1=66(y), r2=31(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 66
LDI r2, 31
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
