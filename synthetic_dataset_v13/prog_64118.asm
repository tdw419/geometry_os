; DESCRIPTION: Creates a blue rectangular region at (11, 41) spanning 89 by 70 pixels.
; PLAN: r0=11(x), r1=41(y), r2=89(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 41
LDI r2, 89
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
