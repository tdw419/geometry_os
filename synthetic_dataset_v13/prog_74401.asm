; DESCRIPTION: Renders a purple box of size 81x82 starting at (57, 66).
; PLAN: r0=57(x), r1=66(y), r2=81(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 66
LDI r2, 81
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
