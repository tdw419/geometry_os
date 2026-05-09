; DESCRIPTION: Draws a blue rectangle at (218, 44) with width 108 and height 97.
; PLAN: r0=218(x), r1=44(y), r2=108(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 44
LDI r2, 108
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
