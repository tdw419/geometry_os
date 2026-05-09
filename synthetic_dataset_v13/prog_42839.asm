; DESCRIPTION: Draws a white rectangle at (19, 17) with width 39 and height 24.
; PLAN: r0=19(x), r1=17(y), r2=39(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 17
LDI r2, 39
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
