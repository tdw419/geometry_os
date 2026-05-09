; DESCRIPTION: Creates a orange rectangular region at (155, 51) spanning 24 by 117 pixels.
; PLAN: r0=155(x), r1=51(y), r2=24(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 51
LDI r2, 24
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
