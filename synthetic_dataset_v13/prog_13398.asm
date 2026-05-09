; DESCRIPTION: Renders a blue box of size 113x56 starting at (339, 119).
; PLAN: r0=339(x), r1=119(y), r2=113(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 119
LDI r2, 113
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
