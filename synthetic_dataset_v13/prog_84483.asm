; DESCRIPTION: Creates a orange rectangular region at (270, 51) spanning 89 by 98 pixels.
; PLAN: r0=270(x), r1=51(y), r2=89(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 51
LDI r2, 89
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
