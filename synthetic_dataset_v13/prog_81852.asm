; DESCRIPTION: Creates a orange rectangular region at (357, 114) spanning 21 by 118 pixels.
; PLAN: r0=357(x), r1=114(y), r2=21(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 114
LDI r2, 21
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
