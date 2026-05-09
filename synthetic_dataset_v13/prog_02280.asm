; DESCRIPTION: Creates a orange rectangular region at (219, 66) spanning 27 by 118 pixels.
; PLAN: r0=219(x), r1=66(y), r2=27(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 66
LDI r2, 27
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
