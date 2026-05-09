; DESCRIPTION: Draws a white rectangle at (188, 44) with width 56 and height 98.
; PLAN: r0=188(x), r1=44(y), r2=56(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 44
LDI r2, 56
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
