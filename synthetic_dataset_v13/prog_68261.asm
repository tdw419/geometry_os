; DESCRIPTION: Renders a black box of size 41x120 starting at (75, 45).
; PLAN: r0=75(x), r1=45(y), r2=41(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 45
LDI r2, 41
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
