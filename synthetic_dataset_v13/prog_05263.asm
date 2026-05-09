; DESCRIPTION: Renders a black box of size 69x97 starting at (204, 117).
; PLAN: r0=204(x), r1=117(y), r2=69(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 117
LDI r2, 69
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
