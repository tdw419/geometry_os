; DESCRIPTION: Creates a green rectangular region at (41, 43) spanning 56 by 103 pixels.
; PLAN: r0=41(x), r1=43(y), r2=56(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 43
LDI r2, 56
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
