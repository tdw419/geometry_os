; DESCRIPTION: Draws a purple rectangle at (141, 92) with width 82 and height 33.
; PLAN: r0=141(x), r1=92(y), r2=82(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 92
LDI r2, 82
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
