; DESCRIPTION: Renders a black box of size 106x29 starting at (192, 52).
; PLAN: r0=192(x), r1=52(y), r2=106(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 52
LDI r2, 106
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
