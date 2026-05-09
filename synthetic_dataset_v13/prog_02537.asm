; DESCRIPTION: Renders a blue box of size 83x29 starting at (259, 70).
; PLAN: r0=259(x), r1=70(y), r2=83(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 70
LDI r2, 83
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
