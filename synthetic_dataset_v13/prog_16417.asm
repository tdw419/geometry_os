; DESCRIPTION: Renders a blue box of size 105x89 starting at (345, 166).
; PLAN: r0=345(x), r1=166(y), r2=105(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 166
LDI r2, 105
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
