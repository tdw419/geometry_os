; DESCRIPTION: Draws a white rectangle at (144, 150) with width 37 and height 98.
; PLAN: r0=144(x), r1=150(y), r2=37(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 150
LDI r2, 37
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
