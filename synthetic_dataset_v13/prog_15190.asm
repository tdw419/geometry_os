; DESCRIPTION: Renders a red box of size 119x62 starting at (124, 155).
; PLAN: r0=124(x), r1=155(y), r2=119(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 155
LDI r2, 119
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
