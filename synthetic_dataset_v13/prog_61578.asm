; DESCRIPTION: Draws a blue rectangle at (317, 20) with width 108 and height 117.
; PLAN: r0=317(x), r1=20(y), r2=108(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 20
LDI r2, 108
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
