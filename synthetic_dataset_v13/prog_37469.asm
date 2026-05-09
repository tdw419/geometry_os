; DESCRIPTION: Draws a white rectangle at (350, 141) with width 63 and height 29.
; PLAN: r0=350(x), r1=141(y), r2=63(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 141
LDI r2, 63
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
