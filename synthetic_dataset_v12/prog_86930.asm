; DESCRIPTION: Renders a white box of size 105x111 starting at (99, 53).
; PLAN: r0=99(x), r1=53(y), r2=105(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 53
LDI r2, 105
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
