; DESCRIPTION: Draws a blue rectangle at (279, 127) with width 16 and height 86.
; PLAN: r0=279(x), r1=127(y), r2=16(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 127
LDI r2, 16
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
