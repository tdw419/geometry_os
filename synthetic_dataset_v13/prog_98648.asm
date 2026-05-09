; DESCRIPTION: Draws a white rectangle at (261, 107) with width 48 and height 17.
; PLAN: r0=261(x), r1=107(y), r2=48(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 107
LDI r2, 48
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
