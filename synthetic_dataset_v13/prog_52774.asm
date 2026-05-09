; DESCRIPTION: Renders a blue box of size 98x98 starting at (118, 35).
; PLAN: r0=118(x), r1=35(y), r2=98(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 35
LDI r2, 98
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
