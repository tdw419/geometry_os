; DESCRIPTION: Renders a purple box of size 86x105 starting at (31, 62).
; PLAN: r0=31(x), r1=62(y), r2=86(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 62
LDI r2, 86
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
