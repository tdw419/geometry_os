; DESCRIPTION: Draws a blue rectangle at (279, 70) with width 64 and height 65.
; PLAN: r0=279(x), r1=70(y), r2=64(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 70
LDI r2, 64
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
