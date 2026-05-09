; DESCRIPTION: Creates a orange rectangular region at (28, 218) spanning 118 by 22 pixels.
; PLAN: r0=28(x), r1=218(y), r2=118(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 218
LDI r2, 118
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
