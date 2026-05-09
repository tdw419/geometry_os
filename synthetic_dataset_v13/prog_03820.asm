; DESCRIPTION: Renders a blue box of size 38x107 starting at (222, 118).
; PLAN: r0=222(x), r1=118(y), r2=38(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 118
LDI r2, 38
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
