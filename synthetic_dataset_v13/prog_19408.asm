; DESCRIPTION: Renders a red box of size 89x19 starting at (270, 93).
; PLAN: r0=270(x), r1=93(y), r2=89(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 93
LDI r2, 89
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
