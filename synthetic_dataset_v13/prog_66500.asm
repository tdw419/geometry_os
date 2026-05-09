; DESCRIPTION: Creates a blue rectangular region at (368, 41) spanning 118 by 98 pixels.
; PLAN: r0=368(x), r1=41(y), r2=118(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 41
LDI r2, 118
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
