; DESCRIPTION: Draws a green rectangle at (346, 30) with width 68 and height 37.
; PLAN: r0=346(x), r1=30(y), r2=68(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 30
LDI r2, 68
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
