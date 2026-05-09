; DESCRIPTION: Renders a blue box of size 115x11 starting at (317, 80).
; PLAN: r0=317(x), r1=80(y), r2=115(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 80
LDI r2, 115
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
