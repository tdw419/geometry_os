; DESCRIPTION: Renders a black box of size 69x97 starting at (140, 124).
; PLAN: r0=140(x), r1=124(y), r2=69(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 124
LDI r2, 69
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
