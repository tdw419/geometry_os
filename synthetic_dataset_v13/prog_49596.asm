; DESCRIPTION: Renders a blue box of size 35x53 starting at (469, 184).
; PLAN: r0=469(x), r1=184(y), r2=35(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 184
LDI r2, 35
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
