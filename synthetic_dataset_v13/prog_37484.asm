; DESCRIPTION: Draws a blue rectangle at (106, 57) with width 104 and height 98.
; PLAN: r0=106(x), r1=57(y), r2=104(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 57
LDI r2, 104
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
