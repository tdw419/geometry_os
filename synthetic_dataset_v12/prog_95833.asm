; DESCRIPTION: Renders a purple box of size 10x88 starting at (243, 70).
; PLAN: r0=243(x), r1=70(y), r2=10(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 70
LDI r2, 10
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
