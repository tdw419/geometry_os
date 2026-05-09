; DESCRIPTION: Draws a white rectangle at (15, 169) with width 64 and height 63.
; PLAN: r0=15(x), r1=169(y), r2=64(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 169
LDI r2, 64
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
