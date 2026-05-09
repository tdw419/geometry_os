; DESCRIPTION: Draws a white rectangle at (195, 111) with width 51 and height 62.
; PLAN: r0=195(x), r1=111(y), r2=51(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 111
LDI r2, 51
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
