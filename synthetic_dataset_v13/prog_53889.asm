; DESCRIPTION: Renders a white box of size 22x97 starting at (107, 136).
; PLAN: r0=107(x), r1=136(y), r2=22(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 136
LDI r2, 22
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
