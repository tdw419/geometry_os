; DESCRIPTION: Renders a yellow box of size 41x95 starting at (380, 100).
; PLAN: r0=380(x), r1=100(y), r2=41(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 100
LDI r2, 41
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
