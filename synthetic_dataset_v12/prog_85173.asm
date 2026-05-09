; DESCRIPTION: Creates a orange rectangular region at (51, 52) spanning 119 by 10 pixels.
; PLAN: r0=51(x), r1=52(y), r2=119(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 52
LDI r2, 119
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
