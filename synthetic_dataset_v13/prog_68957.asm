; DESCRIPTION: Creates a green rectangular region at (19, 60) spanning 114 by 41 pixels.
; PLAN: r0=19(x), r1=60(y), r2=114(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 60
LDI r2, 114
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
