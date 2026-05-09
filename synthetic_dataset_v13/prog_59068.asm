; DESCRIPTION: Renders a purple box of size 80x45 starting at (151, 41).
; PLAN: r0=151(x), r1=41(y), r2=80(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 41
LDI r2, 80
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
