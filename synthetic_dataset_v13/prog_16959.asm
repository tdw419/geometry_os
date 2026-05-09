; DESCRIPTION: Draws a blue rectangle at (68, 39) with width 57 and height 79.
; PLAN: r0=68(x), r1=39(y), r2=57(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 39
LDI r2, 57
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
