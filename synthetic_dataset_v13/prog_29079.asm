; DESCRIPTION: Draws a white rectangle at (163, 195) with width 81 and height 50.
; PLAN: r0=163(x), r1=195(y), r2=81(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 195
LDI r2, 81
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
