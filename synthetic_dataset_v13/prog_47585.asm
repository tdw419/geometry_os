; DESCRIPTION: Draws a magenta rectangle at (196, 193) with width 112 and height 31.
; PLAN: r0=196(x), r1=193(y), r2=112(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 193
LDI r2, 112
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
