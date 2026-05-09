; DESCRIPTION: Draws a magenta rectangle at (333, 196) with width 85 and height 17.
; PLAN: r0=333(x), r1=196(y), r2=85(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 196
LDI r2, 85
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
