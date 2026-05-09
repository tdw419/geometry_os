; DESCRIPTION: Renders a black box of size 116x29 starting at (216, 77).
; PLAN: r0=216(x), r1=77(y), r2=116(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 77
LDI r2, 116
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
