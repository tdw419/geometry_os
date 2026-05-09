; DESCRIPTION: Draws a green rectangle at (440, 136) with width 33 and height 102.
; PLAN: r0=440(x), r1=136(y), r2=33(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 136
LDI r2, 33
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
