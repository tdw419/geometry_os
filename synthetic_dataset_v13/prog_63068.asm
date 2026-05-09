; DESCRIPTION: Renders a blue box of size 85x118 starting at (171, 129).
; PLAN: r0=171(x), r1=129(y), r2=85(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 129
LDI r2, 85
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
