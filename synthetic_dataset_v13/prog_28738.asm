; DESCRIPTION: Draws a white rectangle at (354, 136) with width 21 and height 14.
; PLAN: r0=354(x), r1=136(y), r2=21(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 136
LDI r2, 21
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
