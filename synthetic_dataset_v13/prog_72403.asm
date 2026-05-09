; DESCRIPTION: Renders a green box of size 76x29 starting at (158, 118).
; PLAN: r0=158(x), r1=118(y), r2=76(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 118
LDI r2, 76
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
