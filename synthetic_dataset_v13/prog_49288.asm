; DESCRIPTION: Draws a white rectangle at (7, 113) with width 33 and height 92.
; PLAN: r0=7(x), r1=113(y), r2=33(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 113
LDI r2, 33
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
