; DESCRIPTION: Renders a black box of size 57x41 starting at (424, 115).
; PLAN: r0=424(x), r1=115(y), r2=57(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 115
LDI r2, 57
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
