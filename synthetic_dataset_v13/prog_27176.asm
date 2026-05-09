; DESCRIPTION: Renders a white box of size 105x88 starting at (307, 129).
; PLAN: r0=307(x), r1=129(y), r2=105(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 129
LDI r2, 105
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
