; DESCRIPTION: Creates a green rectangular region at (41, 122) spanning 107 by 52 pixels.
; PLAN: r0=41(x), r1=122(y), r2=107(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 122
LDI r2, 107
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
