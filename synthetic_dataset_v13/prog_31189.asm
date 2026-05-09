; DESCRIPTION: Renders a red box of size 47x114 starting at (238, 31).
; PLAN: r0=238(x), r1=31(y), r2=47(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 31
LDI r2, 47
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
