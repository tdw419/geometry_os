; DESCRIPTION: Creates a blue rectangular region at (49, 164) spanning 69 by 41 pixels.
; PLAN: r0=49(x), r1=164(y), r2=69(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 164
LDI r2, 69
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
