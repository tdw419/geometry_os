; DESCRIPTION: Renders a black box of size 65x13 starting at (49, 52).
; PLAN: r0=49(x), r1=52(y), r2=65(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 52
LDI r2, 65
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
