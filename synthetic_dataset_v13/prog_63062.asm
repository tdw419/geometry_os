; DESCRIPTION: Draws a blue rectangle at (324, 25) with width 47 and height 102.
; PLAN: r0=324(x), r1=25(y), r2=47(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 25
LDI r2, 47
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
