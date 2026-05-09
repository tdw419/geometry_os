; DESCRIPTION: Renders a blue box of size 21x107 starting at (109, 66).
; PLAN: r0=109(x), r1=66(y), r2=21(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 66
LDI r2, 21
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
