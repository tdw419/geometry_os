; DESCRIPTION: Renders a purple box of size 46x50 starting at (191, 110).
; PLAN: r0=191(x), r1=110(y), r2=46(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 110
LDI r2, 46
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
