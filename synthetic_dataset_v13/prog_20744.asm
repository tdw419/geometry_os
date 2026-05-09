; DESCRIPTION: Renders a purple box of size 92x36 starting at (270, 87).
; PLAN: r0=270(x), r1=87(y), r2=92(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 87
LDI r2, 92
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
