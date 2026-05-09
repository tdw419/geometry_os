; DESCRIPTION: Renders a blue box of size 92x117 starting at (94, 119).
; PLAN: r0=94(x), r1=119(y), r2=92(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 119
LDI r2, 92
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
