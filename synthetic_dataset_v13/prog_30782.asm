; DESCRIPTION: Renders a black box of size 108x112 starting at (199, 97).
; PLAN: r0=199(x), r1=97(y), r2=108(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 97
LDI r2, 108
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
