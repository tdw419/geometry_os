; DESCRIPTION: Draws a black rectangle at (354, 70) with width 97 and height 79.
; PLAN: r0=354(x), r1=70(y), r2=97(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 70
LDI r2, 97
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
