; DESCRIPTION: Renders a black box of size 36x35 starting at (339, 58).
; PLAN: r0=339(x), r1=58(y), r2=36(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 58
LDI r2, 36
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
