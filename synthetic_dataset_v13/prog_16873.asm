; DESCRIPTION: Renders a purple box of size 84x19 starting at (122, 98).
; PLAN: r0=122(x), r1=98(y), r2=84(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 98
LDI r2, 84
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
