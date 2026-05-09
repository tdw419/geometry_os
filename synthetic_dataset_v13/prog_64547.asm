; DESCRIPTION: Draws a white rectangle at (203, 237) with width 44 and height 17.
; PLAN: r0=203(x), r1=237(y), r2=44(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 237
LDI r2, 44
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
