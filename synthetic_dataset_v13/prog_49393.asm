; DESCRIPTION: Renders a purple box of size 84x79 starting at (181, 98).
; PLAN: r0=181(x), r1=98(y), r2=84(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 98
LDI r2, 84
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
