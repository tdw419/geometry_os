; DESCRIPTION: Renders a purple box of size 105x66 starting at (3, 93).
; PLAN: r0=3(x), r1=93(y), r2=105(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 93
LDI r2, 105
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
