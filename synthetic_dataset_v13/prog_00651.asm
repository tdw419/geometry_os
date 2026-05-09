; DESCRIPTION: Creates a orange rectangular region at (245, 52) spanning 105 by 66 pixels.
; PLAN: r0=245(x), r1=52(y), r2=105(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 52
LDI r2, 105
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
