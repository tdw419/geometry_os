; DESCRIPTION: Renders a black box of size 29x120 starting at (216, 129).
; PLAN: r0=216(x), r1=129(y), r2=29(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 129
LDI r2, 29
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
