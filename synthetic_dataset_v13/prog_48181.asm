; DESCRIPTION: Renders a blue box of size 57x89 starting at (26, 125).
; PLAN: r0=26(x), r1=125(y), r2=57(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 125
LDI r2, 57
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
