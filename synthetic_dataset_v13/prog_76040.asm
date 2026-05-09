; DESCRIPTION: Draws a purple rectangle at (116, 108) with width 109 and height 60.
; PLAN: r0=116(x), r1=108(y), r2=109(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 108
LDI r2, 109
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
