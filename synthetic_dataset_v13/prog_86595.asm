; DESCRIPTION: Renders a purple box of size 91x46 starting at (395, 122).
; PLAN: r0=395(x), r1=122(y), r2=91(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 122
LDI r2, 91
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
