; DESCRIPTION: Creates a purple rectangular region at (176, 123) spanning 41 by 66 pixels.
; PLAN: r0=176(x), r1=123(y), r2=41(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 123
LDI r2, 41
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
