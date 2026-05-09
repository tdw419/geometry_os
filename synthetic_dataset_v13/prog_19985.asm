; DESCRIPTION: Draws a magenta rectangle at (118, 154) with width 33 and height 52.
; PLAN: r0=118(x), r1=154(y), r2=33(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 154
LDI r2, 33
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
