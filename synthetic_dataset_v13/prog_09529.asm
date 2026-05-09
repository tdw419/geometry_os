; DESCRIPTION: Renders a black box of size 92x67 starting at (181, 41).
; PLAN: r0=181(x), r1=41(y), r2=92(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 41
LDI r2, 92
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
