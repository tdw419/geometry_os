; DESCRIPTION: Creates a orange rectangular region at (145, 57) spanning 66 by 118 pixels.
; PLAN: r0=145(x), r1=57(y), r2=66(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 57
LDI r2, 66
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
