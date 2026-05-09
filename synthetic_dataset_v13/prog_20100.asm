; DESCRIPTION: Renders a white box of size 97x25 starting at (227, 36).
; PLAN: r0=227(x), r1=36(y), r2=97(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 36
LDI r2, 97
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
