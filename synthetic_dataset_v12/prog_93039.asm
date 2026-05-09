; DESCRIPTION: Renders a red box of size 88x73 starting at (33, 139).
; PLAN: r0=33(x), r1=139(y), r2=88(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 139
LDI r2, 88
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
