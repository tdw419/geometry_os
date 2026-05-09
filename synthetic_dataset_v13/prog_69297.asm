; DESCRIPTION: Draws a magenta rectangle at (300, 209) with width 29 and height 16.
; PLAN: r0=300(x), r1=209(y), r2=29(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 209
LDI r2, 29
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
