; DESCRIPTION: Renders a red box of size 49x119 starting at (44, 23).
; PLAN: r0=44(x), r1=23(y), r2=49(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 23
LDI r2, 49
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
