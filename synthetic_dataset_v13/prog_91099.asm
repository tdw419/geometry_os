; DESCRIPTION: Draws a white rectangle at (19, 59) with width 48 and height 94.
; PLAN: r0=19(x), r1=59(y), r2=48(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 59
LDI r2, 48
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
