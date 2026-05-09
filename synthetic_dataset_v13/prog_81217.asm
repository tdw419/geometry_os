; DESCRIPTION: Draws a magenta rectangle at (211, 154) with width 31 and height 51.
; PLAN: r0=211(x), r1=154(y), r2=31(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 154
LDI r2, 31
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
