; DESCRIPTION: Draws a magenta rectangle at (42, 225) with width 44 and height 10.
; PLAN: r0=42(x), r1=225(y), r2=44(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 225
LDI r2, 44
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
