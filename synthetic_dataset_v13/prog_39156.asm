; DESCRIPTION: Renders a yellow box of size 53x66 starting at (26, 41).
; PLAN: r0=26(x), r1=41(y), r2=53(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 41
LDI r2, 53
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
