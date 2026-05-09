; DESCRIPTION: Draws a blue rectangle at (408, 149) with width 39 and height 13.
; PLAN: r0=408(x), r1=149(y), r2=39(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 149
LDI r2, 39
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
