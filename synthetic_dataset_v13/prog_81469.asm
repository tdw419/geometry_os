; DESCRIPTION: Renders a purple box of size 98x84 starting at (328, 123).
; PLAN: r0=328(x), r1=123(y), r2=98(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 123
LDI r2, 98
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
