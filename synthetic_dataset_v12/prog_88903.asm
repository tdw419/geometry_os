; DESCRIPTION: Renders a blue box of size 23x71 starting at (448, 30).
; PLAN: r0=448(x), r1=30(y), r2=23(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 30
LDI r2, 23
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
