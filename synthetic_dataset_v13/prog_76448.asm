; DESCRIPTION: Draws a purple rectangle at (314, 121) with width 82 and height 108.
; PLAN: r0=314(x), r1=121(y), r2=82(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 121
LDI r2, 82
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
