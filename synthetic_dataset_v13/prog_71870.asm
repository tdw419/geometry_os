; DESCRIPTION: Renders a black box of size 90x19 starting at (96, 121).
; PLAN: r0=96(x), r1=121(y), r2=90(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 121
LDI r2, 90
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
