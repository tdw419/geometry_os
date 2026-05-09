; DESCRIPTION: Creates a orange rectangular region at (334, 71) spanning 11 by 112 pixels.
; PLAN: r0=334(x), r1=71(y), r2=11(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 71
LDI r2, 11
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
