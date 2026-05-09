; DESCRIPTION: Draws a green rectangle at (412, 53) with width 75 and height 79.
; PLAN: r0=412(x), r1=53(y), r2=75(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 53
LDI r2, 75
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
