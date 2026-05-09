; DESCRIPTION: Creates a purple rectangular region at (41, 187) spanning 62 by 24 pixels.
; PLAN: r0=41(x), r1=187(y), r2=62(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 187
LDI r2, 62
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
