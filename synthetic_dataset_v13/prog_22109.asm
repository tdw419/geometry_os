; DESCRIPTION: Renders a black box of size 88x13 starting at (326, 73).
; PLAN: r0=326(x), r1=73(y), r2=88(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 73
LDI r2, 88
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
