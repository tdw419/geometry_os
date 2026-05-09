; DESCRIPTION: Draws a green rectangle at (218, 138) with width 36 and height 97.
; PLAN: r0=218(x), r1=138(y), r2=36(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 138
LDI r2, 36
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
