; DESCRIPTION: Draws a blue rectangle at (268, 112) with width 25 and height 47.
; PLAN: r0=268(x), r1=112(y), r2=25(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 112
LDI r2, 25
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
