; DESCRIPTION: Renders a white box of size 62x13 starting at (118, 136).
; PLAN: r0=118(x), r1=136(y), r2=62(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 136
LDI r2, 62
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
