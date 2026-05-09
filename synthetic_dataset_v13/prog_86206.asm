; DESCRIPTION: Renders a red box of size 49x20 starting at (383, 34).
; PLAN: r0=383(x), r1=34(y), r2=49(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 34
LDI r2, 49
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
