; DESCRIPTION: Draws a blue rectangle at (59, 65) with width 83 and height 60.
; PLAN: r0=59(x), r1=65(y), r2=83(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 65
LDI r2, 83
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
