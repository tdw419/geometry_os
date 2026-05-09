; DESCRIPTION: Draws a white rectangle at (230, 35) with width 59 and height 75.
; PLAN: r0=230(x), r1=35(y), r2=59(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 35
LDI r2, 59
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
