; DESCRIPTION: Creates a purple rectangular region at (250, 118) spanning 41 by 105 pixels.
; PLAN: r0=250(x), r1=118(y), r2=41(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 118
LDI r2, 41
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
