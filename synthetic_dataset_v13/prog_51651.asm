; DESCRIPTION: Draws a white rectangle at (420, 63) with width 85 and height 111.
; PLAN: r0=420(x), r1=63(y), r2=85(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 63
LDI r2, 85
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
