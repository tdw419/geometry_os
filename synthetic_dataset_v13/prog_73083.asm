; DESCRIPTION: Renders a purple box of size 70x16 starting at (84, 119).
; PLAN: r0=84(x), r1=119(y), r2=70(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 119
LDI r2, 70
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
