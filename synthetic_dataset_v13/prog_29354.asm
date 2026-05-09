; DESCRIPTION: Draws a blue rectangle at (349, 151) with width 118 and height 71.
; PLAN: r0=349(x), r1=151(y), r2=118(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 151
LDI r2, 118
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
