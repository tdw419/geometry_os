; DESCRIPTION: Creates a orange rectangular region at (227, 106) spanning 51 by 65 pixels.
; PLAN: r0=227(x), r1=106(y), r2=51(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 106
LDI r2, 51
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
