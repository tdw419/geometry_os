; DESCRIPTION: Creates a blue rectangular region at (12, 67) spanning 41 by 75 pixels.
; PLAN: r0=12(x), r1=67(y), r2=41(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 67
LDI r2, 41
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
