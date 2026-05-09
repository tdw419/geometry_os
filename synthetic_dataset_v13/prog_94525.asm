; DESCRIPTION: Renders a blue box of size 84x94 starting at (260, 89).
; PLAN: r0=260(x), r1=89(y), r2=84(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 89
LDI r2, 84
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
