; DESCRIPTION: Renders a black box of size 110x22 starting at (194, 54).
; PLAN: r0=194(x), r1=54(y), r2=110(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 54
LDI r2, 110
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
