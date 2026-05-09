; DESCRIPTION: Creates a orange rectangular region at (106, 219) spanning 114 by 25 pixels.
; PLAN: r0=106(x), r1=219(y), r2=114(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 219
LDI r2, 114
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
