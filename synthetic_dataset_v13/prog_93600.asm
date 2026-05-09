; DESCRIPTION: Creates a blue rectangular region at (60, 27) spanning 41 by 76 pixels.
; PLAN: r0=60(x), r1=27(y), r2=41(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 27
LDI r2, 41
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
