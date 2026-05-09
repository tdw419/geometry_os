; DESCRIPTION: Draws a blue rectangle at (280, 149) with width 21 and height 83.
; PLAN: r0=280(x), r1=149(y), r2=21(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 149
LDI r2, 21
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
