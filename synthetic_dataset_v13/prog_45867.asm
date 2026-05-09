; DESCRIPTION: Renders a purple box of size 100x33 starting at (342, 122).
; PLAN: r0=342(x), r1=122(y), r2=100(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 122
LDI r2, 100
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
