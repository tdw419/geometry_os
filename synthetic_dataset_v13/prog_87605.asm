; DESCRIPTION: Creates a orange rectangular region at (158, 63) spanning 39 by 118 pixels.
; PLAN: r0=158(x), r1=63(y), r2=39(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 63
LDI r2, 39
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
