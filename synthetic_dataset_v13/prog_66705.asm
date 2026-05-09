; DESCRIPTION: Draws a blue rectangle at (161, 124) with width 65 and height 111.
; PLAN: r0=161(x), r1=124(y), r2=65(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 124
LDI r2, 65
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
