; DESCRIPTION: Draws a green rectangle at (415, 19) with width 74 and height 47.
; PLAN: r0=415(x), r1=19(y), r2=74(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 19
LDI r2, 74
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
