; DESCRIPTION: Renders a purple box of size 118x58 starting at (221, 84).
; PLAN: r0=221(x), r1=84(y), r2=118(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 84
LDI r2, 118
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
