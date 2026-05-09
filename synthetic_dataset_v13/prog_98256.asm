; DESCRIPTION: Draws a blue rectangle at (229, 96) with width 80 and height 87.
; PLAN: r0=229(x), r1=96(y), r2=80(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 96
LDI r2, 80
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
