; DESCRIPTION: Draws a purple rectangle at (186, 113) with width 82 and height 76.
; PLAN: r0=186(x), r1=113(y), r2=82(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 113
LDI r2, 82
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
