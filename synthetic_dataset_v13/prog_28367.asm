; DESCRIPTION: Renders a red box of size 25x35 starting at (478, 76).
; PLAN: r0=478(x), r1=76(y), r2=25(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 76
LDI r2, 25
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
