; DESCRIPTION: Renders a black box of size 46x118 starting at (4, 64).
; PLAN: r0=4(x), r1=64(y), r2=46(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 64
LDI r2, 46
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
