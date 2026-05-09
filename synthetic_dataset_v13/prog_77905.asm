; DESCRIPTION: Draws a yellow rectangle at (388, 66) with width 84 and height 57.
; PLAN: r0=388(x), r1=66(y), r2=84(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 66
LDI r2, 84
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
