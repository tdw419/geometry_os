; DESCRIPTION: Renders a purple box of size 90x119 starting at (232, 122).
; PLAN: r0=232(x), r1=122(y), r2=90(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 122
LDI r2, 90
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
