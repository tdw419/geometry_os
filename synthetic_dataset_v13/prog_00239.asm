; DESCRIPTION: Draws a blue rectangle at (218, 138) with width 54 and height 54.
; PLAN: r0=218(x), r1=138(y), r2=54(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 138
LDI r2, 54
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
