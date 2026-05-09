; DESCRIPTION: Draws a magenta rectangle at (123, 179) with width 44 and height 10.
; PLAN: r0=123(x), r1=179(y), r2=44(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 179
LDI r2, 44
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
