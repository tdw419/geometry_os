; DESCRIPTION: Renders a black box of size 116x22 starting at (35, 14).
; PLAN: r0=35(x), r1=14(y), r2=116(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 14
LDI r2, 116
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
