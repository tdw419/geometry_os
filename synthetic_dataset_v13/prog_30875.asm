; DESCRIPTION: Renders a purple box of size 96x26 starting at (266, 78).
; PLAN: r0=266(x), r1=78(y), r2=96(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 78
LDI r2, 96
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
