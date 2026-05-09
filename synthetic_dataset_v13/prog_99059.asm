; DESCRIPTION: Renders a black box of size 61x41 starting at (38, 28).
; PLAN: r0=38(x), r1=28(y), r2=61(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 28
LDI r2, 61
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
