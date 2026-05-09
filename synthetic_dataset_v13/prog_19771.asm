; DESCRIPTION: Renders a purple box of size 116x105 starting at (37, 78).
; PLAN: r0=37(x), r1=78(y), r2=116(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 78
LDI r2, 116
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
