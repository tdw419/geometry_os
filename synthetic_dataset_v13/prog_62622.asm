; DESCRIPTION: Draws a white rectangle at (436, 25) with width 68 and height 75.
; PLAN: r0=436(x), r1=25(y), r2=68(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 25
LDI r2, 68
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
