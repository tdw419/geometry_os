; DESCRIPTION: Draws a blue rectangle at (368, 86) with width 107 and height 89.
; PLAN: r0=368(x), r1=86(y), r2=107(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 86
LDI r2, 107
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
