; DESCRIPTION: Renders a black box of size 120x118 starting at (12, 109).
; PLAN: r0=12(x), r1=109(y), r2=120(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 109
LDI r2, 120
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
