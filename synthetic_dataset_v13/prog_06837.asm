; DESCRIPTION: Draws a white rectangle at (43, 59) with width 89 and height 108.
; PLAN: r0=43(x), r1=59(y), r2=89(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 59
LDI r2, 89
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
