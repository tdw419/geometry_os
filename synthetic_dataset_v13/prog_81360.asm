; DESCRIPTION: Renders a purple box of size 70x50 starting at (155, 22).
; PLAN: r0=155(x), r1=22(y), r2=70(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 22
LDI r2, 70
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
