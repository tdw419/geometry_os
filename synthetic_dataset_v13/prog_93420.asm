; DESCRIPTION: Creates a orange rectangular region at (24, 233) spanning 51 by 22 pixels.
; PLAN: r0=24(x), r1=233(y), r2=51(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 233
LDI r2, 51
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
