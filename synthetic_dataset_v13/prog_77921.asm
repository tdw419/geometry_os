; DESCRIPTION: Renders a purple box of size 25x84 starting at (176, 150).
; PLAN: r0=176(x), r1=150(y), r2=25(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 150
LDI r2, 25
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
