; DESCRIPTION: Draws a blue rectangle at (77, 192) with width 15 and height 27.
; PLAN: r0=77(x), r1=192(y), r2=15(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 192
LDI r2, 15
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
