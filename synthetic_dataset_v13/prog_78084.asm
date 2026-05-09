; DESCRIPTION: Draws a white rectangle at (108, 145) with width 83 and height 67.
; PLAN: r0=108(x), r1=145(y), r2=83(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 145
LDI r2, 83
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
