; DESCRIPTION: Draws a blue rectangle at (174, 106) with width 57 and height 53.
; PLAN: r0=174(x), r1=106(y), r2=57(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 106
LDI r2, 57
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
