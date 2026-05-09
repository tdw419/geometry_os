; DESCRIPTION: Draws a blue rectangle at (229, 127) with width 47 and height 103.
; PLAN: r0=229(x), r1=127(y), r2=47(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 127
LDI r2, 47
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
