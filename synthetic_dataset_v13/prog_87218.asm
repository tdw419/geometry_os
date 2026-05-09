; DESCRIPTION: Draws a white rectangle at (20, 59) with width 37 and height 108.
; PLAN: r0=20(x), r1=59(y), r2=37(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 59
LDI r2, 37
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
