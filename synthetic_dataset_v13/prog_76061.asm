; DESCRIPTION: Renders a purple box of size 88x112 starting at (70, 85).
; PLAN: r0=70(x), r1=85(y), r2=88(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 85
LDI r2, 88
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
