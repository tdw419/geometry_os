; DESCRIPTION: Creates a blue rectangular region at (134, 41) spanning 24 by 92 pixels.
; PLAN: r0=134(x), r1=41(y), r2=24(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 41
LDI r2, 24
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
