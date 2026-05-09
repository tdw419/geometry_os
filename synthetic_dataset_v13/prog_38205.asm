; DESCRIPTION: Renders a purple box of size 19x41 starting at (375, 70).
; PLAN: r0=375(x), r1=70(y), r2=19(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 70
LDI r2, 19
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
