; DESCRIPTION: Renders a black box of size 81x110 starting at (54, 132).
; PLAN: r0=54(x), r1=132(y), r2=81(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 132
LDI r2, 81
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
