; DESCRIPTION: Draws a green rectangle at (375, 153) with width 84 and height 57.
; PLAN: r0=375(x), r1=153(y), r2=84(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 153
LDI r2, 84
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
