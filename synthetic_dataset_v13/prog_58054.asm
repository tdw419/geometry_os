; DESCRIPTION: Draws a magenta rectangle at (230, 153) with width 16 and height 40.
; PLAN: r0=230(x), r1=153(y), r2=16(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 153
LDI r2, 16
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
