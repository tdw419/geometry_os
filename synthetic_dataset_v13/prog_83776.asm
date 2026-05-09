; DESCRIPTION: Creates a blue rectangular region at (161, 86) spanning 41 by 106 pixels.
; PLAN: r0=161(x), r1=86(y), r2=41(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 86
LDI r2, 41
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
