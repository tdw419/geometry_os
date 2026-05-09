; DESCRIPTION: Renders a black box of size 41x96 starting at (279, 5).
; PLAN: r0=279(x), r1=5(y), r2=41(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 5
LDI r2, 41
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
