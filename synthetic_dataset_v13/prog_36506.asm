; DESCRIPTION: Renders a blue box of size 26x103 starting at (129, 43).
; PLAN: r0=129(x), r1=43(y), r2=26(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 43
LDI r2, 26
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
