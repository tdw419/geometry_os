; DESCRIPTION: Creates a purple rectangular region at (35, 140) spanning 41 by 72 pixels.
; PLAN: r0=35(x), r1=140(y), r2=41(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 140
LDI r2, 41
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
