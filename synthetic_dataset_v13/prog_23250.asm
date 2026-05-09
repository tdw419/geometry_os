; DESCRIPTION: Draws a green rectangle at (175, 70) with width 60 and height 99.
; PLAN: r0=175(x), r1=70(y), r2=60(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 70
LDI r2, 60
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
