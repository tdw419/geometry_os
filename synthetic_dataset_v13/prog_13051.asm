; DESCRIPTION: Draws a green rectangle at (255, 105) with width 102 and height 85.
; PLAN: r0=255(x), r1=105(y), r2=102(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 105
LDI r2, 102
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
