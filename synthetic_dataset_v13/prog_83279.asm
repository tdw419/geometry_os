; DESCRIPTION: Renders a black box of size 82x118 starting at (112, 110).
; PLAN: r0=112(x), r1=110(y), r2=82(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 110
LDI r2, 82
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
