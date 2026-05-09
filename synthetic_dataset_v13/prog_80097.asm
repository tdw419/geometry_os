; DESCRIPTION: Renders a green box of size 66x14 starting at (158, 123).
; PLAN: r0=158(x), r1=123(y), r2=66(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 123
LDI r2, 66
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
