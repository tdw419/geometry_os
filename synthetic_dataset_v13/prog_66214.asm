; DESCRIPTION: Draws a green rectangle at (125, 35) with width 117 and height 57.
; PLAN: r0=125(x), r1=35(y), r2=117(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 35
LDI r2, 117
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
