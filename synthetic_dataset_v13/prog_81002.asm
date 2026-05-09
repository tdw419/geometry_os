; DESCRIPTION: Draws a white rectangle at (391, 20) with width 56 and height 73.
; PLAN: r0=391(x), r1=20(y), r2=56(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 20
LDI r2, 56
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
