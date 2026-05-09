; DESCRIPTION: Draws a blue rectangle at (117, 172) with width 107 and height 11.
; PLAN: r0=117(x), r1=172(y), r2=107(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 172
LDI r2, 107
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
