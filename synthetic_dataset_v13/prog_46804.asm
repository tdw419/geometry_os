; DESCRIPTION: Draws a white rectangle at (81, 56) with width 44 and height 108.
; PLAN: r0=81(x), r1=56(y), r2=44(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 56
LDI r2, 44
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
