; DESCRIPTION: Creates a blue rectangular region at (118, 171) spanning 41 by 29 pixels.
; PLAN: r0=118(x), r1=171(y), r2=41(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 171
LDI r2, 41
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
