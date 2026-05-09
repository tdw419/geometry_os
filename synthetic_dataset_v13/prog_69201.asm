; DESCRIPTION: Renders a purple box of size 117x96 starting at (91, 110).
; PLAN: r0=91(x), r1=110(y), r2=117(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 110
LDI r2, 117
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
