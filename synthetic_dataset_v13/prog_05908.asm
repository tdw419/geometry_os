; DESCRIPTION: Draws a magenta rectangle at (135, 197) with width 110 and height 16.
; PLAN: r0=135(x), r1=197(y), r2=110(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 197
LDI r2, 110
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
