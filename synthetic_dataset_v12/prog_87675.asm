; DESCRIPTION: Renders a black box of size 115x76 starting at (343, 149).
; PLAN: r0=343(x), r1=149(y), r2=115(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 149
LDI r2, 115
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
