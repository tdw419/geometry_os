; DESCRIPTION: Renders a purple box of size 81x116 starting at (163, 124).
; PLAN: r0=163(x), r1=124(y), r2=81(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 124
LDI r2, 81
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
