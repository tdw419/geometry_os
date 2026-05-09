; DESCRIPTION: Draws a blue rectangle at (63, 8) with width 59 and height 120.
; PLAN: r0=63(x), r1=8(y), r2=59(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 8
LDI r2, 59
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
