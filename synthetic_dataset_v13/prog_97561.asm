; DESCRIPTION: Creates a orange rectangular region at (66, 185) spanning 66 by 49 pixels.
; PLAN: r0=66(x), r1=185(y), r2=66(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 185
LDI r2, 66
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
