; DESCRIPTION: Renders a green box of size 75x34 starting at (216, 78).
; PLAN: r0=216(x), r1=78(y), r2=75(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 78
LDI r2, 75
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
