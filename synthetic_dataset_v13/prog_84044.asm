; DESCRIPTION: Creates a green rectangular region at (377, 43) spanning 41 by 105 pixels.
; PLAN: r0=377(x), r1=43(y), r2=41(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 43
LDI r2, 41
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
