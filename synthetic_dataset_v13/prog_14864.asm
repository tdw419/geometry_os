; DESCRIPTION: Draws a purple rectangle at (95, 0) with width 53 and height 108.
; PLAN: r0=95(x), r1=0(y), r2=53(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 0
LDI r2, 53
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
