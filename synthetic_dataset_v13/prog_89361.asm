; DESCRIPTION: Renders a red box of size 119x93 starting at (270, 100).
; PLAN: r0=270(x), r1=100(y), r2=119(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 100
LDI r2, 119
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
