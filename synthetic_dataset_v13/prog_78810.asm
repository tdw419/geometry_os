; DESCRIPTION: Draws a purple rectangle at (194, 30) with width 16 and height 82.
; PLAN: r0=194(x), r1=30(y), r2=16(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 30
LDI r2, 16
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
