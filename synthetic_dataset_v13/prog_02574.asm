; DESCRIPTION: Draws a blue rectangle at (218, 198) with width 120 and height 47.
; PLAN: r0=218(x), r1=198(y), r2=120(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 198
LDI r2, 120
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
