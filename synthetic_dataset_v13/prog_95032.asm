; DESCRIPTION: Draws a green rectangle at (376, 119) with width 30 and height 65.
; PLAN: r0=376(x), r1=119(y), r2=30(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 119
LDI r2, 30
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
