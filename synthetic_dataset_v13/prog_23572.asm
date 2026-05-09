; DESCRIPTION: Renders a green box of size 70x118 starting at (421, 138).
; PLAN: r0=421(x), r1=138(y), r2=70(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 138
LDI r2, 70
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
