; DESCRIPTION: Renders a purple box of size 41x110 starting at (7, 132).
; PLAN: r0=7(x), r1=132(y), r2=41(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 132
LDI r2, 41
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
