; DESCRIPTION: Draws a green rectangle at (434, 84) with width 31 and height 98.
; PLAN: r0=434(x), r1=84(y), r2=31(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 84
LDI r2, 31
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
