; DESCRIPTION: Renders a black box of size 26x28 starting at (456, 19).
; PLAN: r0=456(x), r1=19(y), r2=26(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 19
LDI r2, 26
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
