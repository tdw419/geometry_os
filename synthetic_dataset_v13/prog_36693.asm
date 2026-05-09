; DESCRIPTION: Renders a purple box of size 47x119 starting at (345, 60).
; PLAN: r0=345(x), r1=60(y), r2=47(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 60
LDI r2, 47
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
