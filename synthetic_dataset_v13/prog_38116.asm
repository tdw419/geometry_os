; DESCRIPTION: Draws a purple rectangle at (332, 93) with width 59 and height 39.
; PLAN: r0=332(x), r1=93(y), r2=59(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 93
LDI r2, 59
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
