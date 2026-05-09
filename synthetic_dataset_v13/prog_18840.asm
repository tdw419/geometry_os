; DESCRIPTION: Renders a purple box of size 24x119 starting at (428, 74).
; PLAN: r0=428(x), r1=74(y), r2=24(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 74
LDI r2, 24
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
