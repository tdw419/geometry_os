; DESCRIPTION: Draws a blue rectangle at (193, 101) with width 107 and height 112.
; PLAN: r0=193(x), r1=101(y), r2=107(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 101
LDI r2, 107
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
