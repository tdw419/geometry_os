; DESCRIPTION: Draws a green rectangle at (220, 11) with width 30 and height 80.
; PLAN: r0=220(x), r1=11(y), r2=30(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 11
LDI r2, 30
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
