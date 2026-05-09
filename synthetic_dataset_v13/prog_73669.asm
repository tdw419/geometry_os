; DESCRIPTION: Draws a purple rectangle at (93, 124) with width 73 and height 82.
; PLAN: r0=93(x), r1=124(y), r2=73(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 124
LDI r2, 73
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
