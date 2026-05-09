; DESCRIPTION: Renders a blue box of size 96x28 starting at (91, 118).
; PLAN: r0=91(x), r1=118(y), r2=96(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 118
LDI r2, 96
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
