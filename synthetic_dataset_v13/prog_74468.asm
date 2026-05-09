; DESCRIPTION: Renders a blue box of size 40x35 starting at (93, 34).
; PLAN: r0=93(x), r1=34(y), r2=40(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 34
LDI r2, 40
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
