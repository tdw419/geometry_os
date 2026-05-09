; DESCRIPTION: Draws a blue rectangle at (186, 127) with width 98 and height 115.
; PLAN: r0=186(x), r1=127(y), r2=98(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 127
LDI r2, 98
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
