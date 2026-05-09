; DESCRIPTION: Draws a green rectangle at (184, 112) with width 87 and height 47.
; PLAN: r0=184(x), r1=112(y), r2=87(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 112
LDI r2, 87
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
