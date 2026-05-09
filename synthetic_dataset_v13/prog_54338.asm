; DESCRIPTION: Renders a purple box of size 104x84 starting at (119, 43).
; PLAN: r0=119(x), r1=43(y), r2=104(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 43
LDI r2, 104
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
