; DESCRIPTION: Renders a yellow box of size 45x71 starting at (53, 41).
; PLAN: r0=53(x), r1=41(y), r2=45(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 41
LDI r2, 45
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
