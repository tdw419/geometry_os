; DESCRIPTION: Draws a blue rectangle at (305, 57) with width 81 and height 106.
; PLAN: r0=305(x), r1=57(y), r2=81(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 57
LDI r2, 81
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
