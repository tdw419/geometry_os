; DESCRIPTION: Renders a black box of size 90x88 starting at (233, 14).
; PLAN: r0=233(x), r1=14(y), r2=90(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 14
LDI r2, 90
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
