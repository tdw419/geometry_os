; DESCRIPTION: Draws a blue rectangle at (293, 90) with width 107 and height 108.
; PLAN: r0=293(x), r1=90(y), r2=107(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 90
LDI r2, 107
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
