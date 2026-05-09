; DESCRIPTION: Renders a purple box of size 43x25 starting at (437, 123).
; PLAN: r0=437(x), r1=123(y), r2=43(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 123
LDI r2, 43
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
