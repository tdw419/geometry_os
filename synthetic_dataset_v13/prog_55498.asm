; DESCRIPTION: Renders a white box of size 78x111 starting at (155, 88).
; PLAN: r0=155(x), r1=88(y), r2=78(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 88
LDI r2, 78
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
