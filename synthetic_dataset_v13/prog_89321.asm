; DESCRIPTION: Renders a black box of size 22x43 starting at (14, 212).
; PLAN: r0=14(x), r1=212(y), r2=22(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 212
LDI r2, 22
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
