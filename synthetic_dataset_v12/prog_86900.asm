; DESCRIPTION: Renders a blue box of size 75x75 starting at (231, 114).
; PLAN: r0=231(x), r1=114(y), r2=75(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 114
LDI r2, 75
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
