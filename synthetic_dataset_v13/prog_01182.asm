; DESCRIPTION: Draws a blue rectangle at (57, 115) with width 44 and height 53.
; PLAN: r0=57(x), r1=115(y), r2=44(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 115
LDI r2, 44
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
