; DESCRIPTION: Creates a orange rectangular region at (33, 159) spanning 63 by 66 pixels.
; PLAN: r0=33(x), r1=159(y), r2=63(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 159
LDI r2, 63
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
