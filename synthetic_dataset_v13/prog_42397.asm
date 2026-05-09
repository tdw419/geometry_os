; DESCRIPTION: Draws a white rectangle at (341, 14) with width 19 and height 57.
; PLAN: r0=341(x), r1=14(y), r2=19(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 14
LDI r2, 19
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
