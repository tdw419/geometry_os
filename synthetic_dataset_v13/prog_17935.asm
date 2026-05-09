; DESCRIPTION: Renders a purple box of size 119x46 starting at (344, 114).
; PLAN: r0=344(x), r1=114(y), r2=119(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 114
LDI r2, 119
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
