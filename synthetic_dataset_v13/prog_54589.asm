; DESCRIPTION: Renders a white box of size 23x35 starting at (478, 25).
; PLAN: r0=478(x), r1=25(y), r2=23(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 25
LDI r2, 23
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
