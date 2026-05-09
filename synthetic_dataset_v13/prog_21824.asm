; DESCRIPTION: Renders a purple box of size 118x58 starting at (243, 90).
; PLAN: r0=243(x), r1=90(y), r2=118(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 90
LDI r2, 118
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
