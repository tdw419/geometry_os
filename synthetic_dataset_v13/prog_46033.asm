; DESCRIPTION: Draws a blue rectangle at (257, 120) with width 40 and height 35.
; PLAN: r0=257(x), r1=120(y), r2=40(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 120
LDI r2, 40
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
