; DESCRIPTION: Renders a blue box of size 15x99 starting at (102, 118).
; PLAN: r0=102(x), r1=118(y), r2=15(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 118
LDI r2, 15
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
