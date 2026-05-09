; DESCRIPTION: Draws a white rectangle at (29, 6) with width 57 and height 33.
; PLAN: r0=29(x), r1=6(y), r2=57(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 6
LDI r2, 57
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
