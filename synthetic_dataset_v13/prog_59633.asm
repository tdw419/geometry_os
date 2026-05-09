; DESCRIPTION: Draws a white rectangle at (393, 63) with width 113 and height 20.
; PLAN: r0=393(x), r1=63(y), r2=113(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 63
LDI r2, 113
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
