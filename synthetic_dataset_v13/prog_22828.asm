; DESCRIPTION: Draws a green rectangle at (165, 74) with width 33 and height 79.
; PLAN: r0=165(x), r1=74(y), r2=33(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 74
LDI r2, 33
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
