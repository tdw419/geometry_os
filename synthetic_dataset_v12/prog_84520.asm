; DESCRIPTION: Renders a blue box of size 101x22 starting at (192, 57).
; PLAN: r0=192(x), r1=57(y), r2=101(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 57
LDI r2, 101
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
