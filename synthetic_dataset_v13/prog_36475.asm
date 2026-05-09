; DESCRIPTION: Renders a purple box of size 73x41 starting at (231, 119).
; PLAN: r0=231(x), r1=119(y), r2=73(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 119
LDI r2, 73
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
