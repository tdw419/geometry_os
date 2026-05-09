; DESCRIPTION: Draws a blue rectangle at (196, 151) with width 68 and height 36.
; PLAN: r0=196(x), r1=151(y), r2=68(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 151
LDI r2, 68
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
