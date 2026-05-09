; DESCRIPTION: Renders a blue box of size 120x52 starting at (97, 149).
; PLAN: r0=97(x), r1=149(y), r2=120(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 149
LDI r2, 120
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
