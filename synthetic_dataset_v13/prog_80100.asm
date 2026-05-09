; DESCRIPTION: Renders a purple box of size 86x29 starting at (203, 66).
; PLAN: r0=203(x), r1=66(y), r2=86(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 66
LDI r2, 86
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
