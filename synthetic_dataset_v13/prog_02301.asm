; DESCRIPTION: Draws a green rectangle at (75, 0) with width 47 and height 35.
; PLAN: r0=75(x), r1=0(y), r2=47(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 0
LDI r2, 47
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
