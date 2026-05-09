; DESCRIPTION: Draws a green rectangle at (209, 45) with width 75 and height 73.
; PLAN: r0=209(x), r1=45(y), r2=75(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 45
LDI r2, 75
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
