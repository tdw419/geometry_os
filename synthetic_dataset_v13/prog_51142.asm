; DESCRIPTION: Draws a blue rectangle at (202, 43) with width 72 and height 81.
; PLAN: r0=202(x), r1=43(y), r2=72(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 43
LDI r2, 72
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
