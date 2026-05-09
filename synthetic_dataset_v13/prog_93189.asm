; DESCRIPTION: Renders a black box of size 109x97 starting at (378, 62).
; PLAN: r0=378(x), r1=62(y), r2=109(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 62
LDI r2, 109
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
