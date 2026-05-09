; DESCRIPTION: Renders a white box of size 56x69 starting at (62, 53).
; PLAN: r0=62(x), r1=53(y), r2=56(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 53
LDI r2, 56
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
