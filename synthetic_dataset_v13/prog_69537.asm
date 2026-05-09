; DESCRIPTION: Creates a blue rectangular region at (174, 184) spanning 41 by 66 pixels.
; PLAN: r0=174(x), r1=184(y), r2=41(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 184
LDI r2, 41
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
