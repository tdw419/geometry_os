; DESCRIPTION: Draws a white rectangle at (266, 111) with width 17 and height 70.
; PLAN: r0=266(x), r1=111(y), r2=17(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 111
LDI r2, 17
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
