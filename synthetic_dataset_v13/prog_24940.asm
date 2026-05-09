; DESCRIPTION: Renders a blue box of size 32x15 starting at (140, 89).
; PLAN: r0=140(x), r1=89(y), r2=32(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 89
LDI r2, 32
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
