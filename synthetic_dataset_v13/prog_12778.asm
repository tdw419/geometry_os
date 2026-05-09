; DESCRIPTION: Renders a purple box of size 118x70 starting at (20, 49).
; PLAN: r0=20(x), r1=49(y), r2=118(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 49
LDI r2, 118
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
