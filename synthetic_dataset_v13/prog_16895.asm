; DESCRIPTION: Renders a purple box of size 74x107 starting at (431, 63).
; PLAN: r0=431(x), r1=63(y), r2=74(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 63
LDI r2, 74
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
