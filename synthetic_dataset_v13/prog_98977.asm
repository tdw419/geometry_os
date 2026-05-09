; DESCRIPTION: Draws a blue rectangle at (292, 59) with width 33 and height 20.
; PLAN: r0=292(x), r1=59(y), r2=33(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 59
LDI r2, 33
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
