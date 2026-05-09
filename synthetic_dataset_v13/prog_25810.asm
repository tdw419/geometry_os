; DESCRIPTION: Renders a purple box of size 110x34 starting at (52, 159).
; PLAN: r0=52(x), r1=159(y), r2=110(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 159
LDI r2, 110
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
