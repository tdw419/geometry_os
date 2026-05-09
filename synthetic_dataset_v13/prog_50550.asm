; DESCRIPTION: Draws a green rectangle at (218, 97) with width 83 and height 97.
; PLAN: r0=218(x), r1=97(y), r2=83(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 97
LDI r2, 83
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
