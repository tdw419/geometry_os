; DESCRIPTION: Draws a green rectangle at (415, 104) with width 73 and height 86.
; PLAN: r0=415(x), r1=104(y), r2=73(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 104
LDI r2, 73
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
