; DESCRIPTION: Renders a yellow box of size 26x43 starting at (329, 205).
; PLAN: r0=329(x), r1=205(y), r2=26(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 205
LDI r2, 26
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
