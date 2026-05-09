; DESCRIPTION: Renders a black box of size 93x54 starting at (80, 69).
; PLAN: r0=80(x), r1=69(y), r2=93(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 69
LDI r2, 93
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
