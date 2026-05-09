; DESCRIPTION: Renders a black box of size 82x41 starting at (365, 105).
; PLAN: r0=365(x), r1=105(y), r2=82(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 105
LDI r2, 82
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
