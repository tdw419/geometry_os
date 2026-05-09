; DESCRIPTION: Renders a purple box of size 25x96 starting at (142, 83).
; PLAN: r0=142(x), r1=83(y), r2=25(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 83
LDI r2, 25
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
