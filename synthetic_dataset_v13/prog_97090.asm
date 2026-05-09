; DESCRIPTION: Draws a white rectangle at (354, 11) with width 28 and height 13.
; PLAN: r0=354(x), r1=11(y), r2=28(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 11
LDI r2, 28
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
