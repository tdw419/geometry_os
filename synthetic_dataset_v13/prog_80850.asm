; DESCRIPTION: Renders a black box of size 88x114 starting at (262, 131).
; PLAN: r0=262(x), r1=131(y), r2=88(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 131
LDI r2, 88
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
