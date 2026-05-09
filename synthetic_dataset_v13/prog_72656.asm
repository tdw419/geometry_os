; DESCRIPTION: Renders a green box of size 93x20 starting at (100, 119).
; PLAN: r0=100(x), r1=119(y), r2=93(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 119
LDI r2, 93
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
