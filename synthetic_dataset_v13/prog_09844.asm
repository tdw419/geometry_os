; DESCRIPTION: Draws a blue rectangle at (193, 37) with width 55 and height 47.
; PLAN: r0=193(x), r1=37(y), r2=55(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 37
LDI r2, 55
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
