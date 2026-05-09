; DESCRIPTION: Renders a purple box of size 66x15 starting at (197, 145).
; PLAN: r0=197(x), r1=145(y), r2=66(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 145
LDI r2, 66
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
