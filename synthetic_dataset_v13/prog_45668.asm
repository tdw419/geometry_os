; DESCRIPTION: Renders a red box of size 35x33 starting at (238, 15).
; PLAN: r0=238(x), r1=15(y), r2=35(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 15
LDI r2, 35
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
