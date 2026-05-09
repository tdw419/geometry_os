; DESCRIPTION: Draws a blue rectangle at (13, 64) with width 120 and height 48.
; PLAN: r0=13(x), r1=64(y), r2=120(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 64
LDI r2, 120
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
