; DESCRIPTION: Renders a black box of size 113x119 starting at (181, 33).
; PLAN: r0=181(x), r1=33(y), r2=113(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 33
LDI r2, 113
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
