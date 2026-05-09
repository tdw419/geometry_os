; DESCRIPTION: Renders a black box of size 90x49 starting at (14, 76).
; PLAN: r0=14(x), r1=76(y), r2=90(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 76
LDI r2, 90
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
