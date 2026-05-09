; DESCRIPTION: Creates a purple rectangular region at (355, 45) spanning 41 by 52 pixels.
; PLAN: r0=355(x), r1=45(y), r2=41(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 45
LDI r2, 41
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
