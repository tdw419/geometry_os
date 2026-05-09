; DESCRIPTION: Renders a black box of size 78x119 starting at (114, 70).
; PLAN: r0=114(x), r1=70(y), r2=78(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 70
LDI r2, 78
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
