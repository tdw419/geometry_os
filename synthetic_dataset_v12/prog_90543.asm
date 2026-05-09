; DESCRIPTION: Renders a black box of size 62x76 starting at (55, 30).
; PLAN: r0=55(x), r1=30(y), r2=62(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 30
LDI r2, 62
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
