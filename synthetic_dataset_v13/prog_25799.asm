; DESCRIPTION: Renders a blue box of size 34x106 starting at (144, 142).
; PLAN: r0=144(x), r1=142(y), r2=34(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 142
LDI r2, 34
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
