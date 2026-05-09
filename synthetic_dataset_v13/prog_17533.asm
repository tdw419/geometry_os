; DESCRIPTION: Draws a blue rectangle at (354, 138) with width 58 and height 112.
; PLAN: r0=354(x), r1=138(y), r2=58(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 138
LDI r2, 58
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
