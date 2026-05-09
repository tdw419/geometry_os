; DESCRIPTION: Renders a red box of size 53x97 starting at (114, 121).
; PLAN: r0=114(x), r1=121(y), r2=53(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 121
LDI r2, 53
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
