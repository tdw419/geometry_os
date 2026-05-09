; DESCRIPTION: Creates a purple rectangular region at (41, 13) spanning 20 by 62 pixels.
; PLAN: r0=41(x), r1=13(y), r2=20(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 13
LDI r2, 20
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
