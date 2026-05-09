; DESCRIPTION: Draws a blue rectangle at (31, 57) with width 78 and height 59.
; PLAN: r0=31(x), r1=57(y), r2=78(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 57
LDI r2, 78
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
