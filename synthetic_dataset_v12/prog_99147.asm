; DESCRIPTION: Renders a black box of size 96x24 starting at (412, 41).
; PLAN: r0=412(x), r1=41(y), r2=96(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 41
LDI r2, 96
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
