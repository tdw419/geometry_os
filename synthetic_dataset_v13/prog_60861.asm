; DESCRIPTION: Renders a black box of size 14x19 starting at (377, 149).
; PLAN: r0=377(x), r1=149(y), r2=14(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 149
LDI r2, 14
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
