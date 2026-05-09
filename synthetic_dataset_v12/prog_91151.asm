; DESCRIPTION: Renders a purple box of size 112x13 starting at (180, 155).
; PLAN: r0=180(x), r1=155(y), r2=112(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 155
LDI r2, 112
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
