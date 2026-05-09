; DESCRIPTION: Renders a red box of size 22x118 starting at (8, 39).
; PLAN: r0=8(x), r1=39(y), r2=22(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 39
LDI r2, 22
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
