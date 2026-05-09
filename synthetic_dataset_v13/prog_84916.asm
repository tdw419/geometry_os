; DESCRIPTION: Draws a blue rectangle at (208, 160) with width 77 and height 21.
; PLAN: r0=208(x), r1=160(y), r2=77(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 160
LDI r2, 77
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
