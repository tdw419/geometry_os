; DESCRIPTION: Renders a purple box of size 75x36 starting at (279, 212).
; PLAN: r0=279(x), r1=212(y), r2=75(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 212
LDI r2, 75
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
