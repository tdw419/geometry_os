; DESCRIPTION: Draws a green rectangle at (255, 214) with width 83 and height 35.
; PLAN: r0=255(x), r1=214(y), r2=83(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 214
LDI r2, 83
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
