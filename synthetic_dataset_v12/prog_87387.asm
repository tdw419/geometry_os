; DESCRIPTION: Renders a blue box of size 72x89 starting at (370, 25).
; PLAN: r0=370(x), r1=25(y), r2=72(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 25
LDI r2, 72
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
