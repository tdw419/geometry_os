; DESCRIPTION: Renders a red box of size 25x53 starting at (200, 58).
; PLAN: r0=200(x), r1=58(y), r2=25(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 58
LDI r2, 25
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
