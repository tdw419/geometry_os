; DESCRIPTION: Renders a green box of size 77x53 starting at (226, 69).
; PLAN: r0=226(x), r1=69(y), r2=77(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 69
LDI r2, 77
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
