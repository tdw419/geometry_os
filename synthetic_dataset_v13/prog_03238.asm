; DESCRIPTION: Draws a blue rectangle at (415, 157) with width 75 and height 64.
; PLAN: r0=415(x), r1=157(y), r2=75(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 157
LDI r2, 75
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
