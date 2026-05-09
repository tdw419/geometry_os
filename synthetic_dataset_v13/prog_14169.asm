; DESCRIPTION: Places a black 96x120 rectangle at position (158, 41).
; PLAN: r0=158(x), r1=41(y), r2=96(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 41
LDI r2, 96
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
