; DESCRIPTION: Draws a white rectangle at (156, 63) with width 113 and height 51.
; PLAN: r0=156(x), r1=63(y), r2=113(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 63
LDI r2, 113
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
