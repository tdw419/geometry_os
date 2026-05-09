; DESCRIPTION: Draws a green rectangle at (332, 76) with width 79 and height 16.
; PLAN: r0=332(x), r1=76(y), r2=79(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 76
LDI r2, 79
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
