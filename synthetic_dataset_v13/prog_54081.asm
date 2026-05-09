; DESCRIPTION: Renders a purple box of size 97x41 starting at (78, 8).
; PLAN: r0=78(x), r1=8(y), r2=97(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 8
LDI r2, 97
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
