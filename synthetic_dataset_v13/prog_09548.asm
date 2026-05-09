; DESCRIPTION: Draws a blue rectangle at (25, 151) with width 68 and height 91.
; PLAN: r0=25(x), r1=151(y), r2=68(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 151
LDI r2, 68
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
