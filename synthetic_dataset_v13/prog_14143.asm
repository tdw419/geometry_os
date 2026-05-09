; DESCRIPTION: Draws a blue rectangle at (480, 196) with width 31 and height 13.
; PLAN: r0=480(x), r1=196(y), r2=31(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 196
LDI r2, 31
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
