; DESCRIPTION: Draws a blue rectangle at (165, 50) with width 37 and height 107.
; PLAN: r0=165(x), r1=50(y), r2=37(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 50
LDI r2, 37
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
