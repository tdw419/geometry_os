; DESCRIPTION: Renders a purple box of size 81x25 starting at (426, 64).
; PLAN: r0=426(x), r1=64(y), r2=81(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 64
LDI r2, 81
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
