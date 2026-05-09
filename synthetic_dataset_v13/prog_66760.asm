; DESCRIPTION: Renders a black box of size 66x105 starting at (161, 149).
; PLAN: r0=161(x), r1=149(y), r2=66(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 149
LDI r2, 66
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
