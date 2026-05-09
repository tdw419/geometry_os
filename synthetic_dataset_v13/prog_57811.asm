; DESCRIPTION: Renders a purple box of size 18x116 starting at (382, 97).
; PLAN: r0=382(x), r1=97(y), r2=18(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 97
LDI r2, 18
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
