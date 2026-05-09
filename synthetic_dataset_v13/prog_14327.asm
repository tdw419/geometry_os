; DESCRIPTION: Creates a orange rectangular region at (118, 137) spanning 105 by 84 pixels.
; PLAN: r0=118(x), r1=137(y), r2=105(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 137
LDI r2, 105
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
