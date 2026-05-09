; DESCRIPTION: Renders a black box of size 38x41 starting at (447, 158).
; PLAN: r0=447(x), r1=158(y), r2=38(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 158
LDI r2, 38
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
