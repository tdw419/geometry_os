; DESCRIPTION: Draws a blue rectangle at (236, 143) with width 89 and height 46.
; PLAN: r0=236(x), r1=143(y), r2=89(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 143
LDI r2, 89
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
