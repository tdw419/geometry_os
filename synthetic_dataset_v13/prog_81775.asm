; DESCRIPTION: Draws a magenta rectangle at (124, 197) with width 37 and height 45.
; PLAN: r0=124(x), r1=197(y), r2=37(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 197
LDI r2, 37
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
