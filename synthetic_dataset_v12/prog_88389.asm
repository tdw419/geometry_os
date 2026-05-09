; DESCRIPTION: Draws a green rectangle at (27, 175) with width 70 and height 11.
; PLAN: r0=27(x), r1=175(y), r2=70(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 175
LDI r2, 70
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
