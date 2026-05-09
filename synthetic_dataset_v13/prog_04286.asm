; DESCRIPTION: Renders a yellow box of size 43x34 starting at (456, 62).
; PLAN: r0=456(x), r1=62(y), r2=43(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 62
LDI r2, 43
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
