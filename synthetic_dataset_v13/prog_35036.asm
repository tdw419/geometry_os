; DESCRIPTION: Draws a green rectangle at (35, 70) with width 25 and height 120.
; PLAN: r0=35(x), r1=70(y), r2=25(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 70
LDI r2, 25
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
