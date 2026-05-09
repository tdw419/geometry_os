; DESCRIPTION: Draws a blue rectangle at (228, 82) with width 97 and height 110.
; PLAN: r0=228(x), r1=82(y), r2=97(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 82
LDI r2, 97
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
