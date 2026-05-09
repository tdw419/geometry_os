; DESCRIPTION: Renders a black box of size 101x118 starting at (340, 70).
; PLAN: r0=340(x), r1=70(y), r2=101(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 70
LDI r2, 101
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
