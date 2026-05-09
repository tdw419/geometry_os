; DESCRIPTION: Draws a blue rectangle at (177, 143) with width 15 and height 48.
; PLAN: r0=177(x), r1=143(y), r2=15(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 143
LDI r2, 15
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
