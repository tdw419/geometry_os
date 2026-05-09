; DESCRIPTION: Renders a black box of size 24x66 starting at (149, 43).
; PLAN: r0=149(x), r1=43(y), r2=24(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 43
LDI r2, 24
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
