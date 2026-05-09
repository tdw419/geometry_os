; DESCRIPTION: Renders a black box of size 118x41 starting at (242, 184).
; PLAN: r0=242(x), r1=184(y), r2=118(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 184
LDI r2, 118
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
