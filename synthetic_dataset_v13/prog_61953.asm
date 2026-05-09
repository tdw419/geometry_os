; DESCRIPTION: Renders a red box of size 60x12 starting at (233, 238).
; PLAN: r0=233(x), r1=238(y), r2=60(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 238
LDI r2, 60
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
