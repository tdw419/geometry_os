; DESCRIPTION: Renders a purple box of size 15x69 starting at (145, 142).
; PLAN: r0=145(x), r1=142(y), r2=15(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 142
LDI r2, 15
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
