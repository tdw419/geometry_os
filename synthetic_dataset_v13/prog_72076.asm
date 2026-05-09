; DESCRIPTION: Draws a purple rectangle at (82, 194) with width 60 and height 17.
; PLAN: r0=82(x), r1=194(y), r2=60(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 194
LDI r2, 60
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
