; DESCRIPTION: Renders a purple box of size 50x37 starting at (194, 56).
; PLAN: r0=194(x), r1=56(y), r2=50(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 56
LDI r2, 50
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
