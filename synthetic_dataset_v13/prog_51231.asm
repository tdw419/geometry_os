; DESCRIPTION: Draws a purple rectangle at (286, 151) with width 59 and height 43.
; PLAN: r0=286(x), r1=151(y), r2=59(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 151
LDI r2, 59
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
