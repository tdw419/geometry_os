; DESCRIPTION: Draws a blue rectangle at (261, 47) with width 44 and height 113.
; PLAN: r0=261(x), r1=47(y), r2=44(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 47
LDI r2, 44
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
