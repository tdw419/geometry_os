; DESCRIPTION: Renders a white box of size 100x81 starting at (80, 53).
; PLAN: r0=80(x), r1=53(y), r2=100(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 53
LDI r2, 100
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
