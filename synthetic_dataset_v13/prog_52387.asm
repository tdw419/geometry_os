; DESCRIPTION: Creates a yellow rectangular region at (396, 69) spanning 107 by 41 pixels.
; PLAN: r0=396(x), r1=69(y), r2=107(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 69
LDI r2, 107
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
