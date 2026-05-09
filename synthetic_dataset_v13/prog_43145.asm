; DESCRIPTION: Draws a blue rectangle at (251, 196) with width 12 and height 59.
; PLAN: r0=251(x), r1=196(y), r2=12(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 196
LDI r2, 12
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
