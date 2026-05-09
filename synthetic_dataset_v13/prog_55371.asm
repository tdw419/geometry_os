; DESCRIPTION: Renders a blue box of size 85x92 starting at (205, 118).
; PLAN: r0=205(x), r1=118(y), r2=85(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 118
LDI r2, 85
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
