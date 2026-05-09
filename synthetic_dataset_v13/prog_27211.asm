; DESCRIPTION: Draws a green rectangle at (252, 20) with width 50 and height 56.
; PLAN: r0=252(x), r1=20(y), r2=50(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 20
LDI r2, 50
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
