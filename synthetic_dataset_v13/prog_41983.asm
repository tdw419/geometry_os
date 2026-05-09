; DESCRIPTION: Renders a red box of size 22x49 starting at (456, 189).
; PLAN: r0=456(x), r1=189(y), r2=22(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 189
LDI r2, 22
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
