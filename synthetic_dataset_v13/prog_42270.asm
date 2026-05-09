; DESCRIPTION: Draws a purple rectangle at (269, 143) with width 92 and height 81.
; PLAN: r0=269(x), r1=143(y), r2=92(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 143
LDI r2, 92
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
