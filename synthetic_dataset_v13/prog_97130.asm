; DESCRIPTION: Draws a green rectangle at (184, 45) with width 87 and height 30.
; PLAN: r0=184(x), r1=45(y), r2=87(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 45
LDI r2, 87
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
