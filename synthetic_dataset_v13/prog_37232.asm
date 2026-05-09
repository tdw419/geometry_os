; DESCRIPTION: Renders a white box of size 53x88 starting at (140, 139).
; PLAN: r0=140(x), r1=139(y), r2=53(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 139
LDI r2, 53
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
