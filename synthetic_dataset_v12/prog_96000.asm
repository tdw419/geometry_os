; DESCRIPTION: Draws a blue rectangle at (218, 127) with width 18 and height 111.
; PLAN: r0=218(x), r1=127(y), r2=18(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 127
LDI r2, 18
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
