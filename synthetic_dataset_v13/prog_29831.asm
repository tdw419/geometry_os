; DESCRIPTION: Renders a black box of size 41x72 starting at (347, 69).
; PLAN: r0=347(x), r1=69(y), r2=41(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 69
LDI r2, 41
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
