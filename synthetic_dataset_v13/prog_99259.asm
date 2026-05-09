; DESCRIPTION: Draws a magenta rectangle at (4, 131) with width 42 and height 73.
; PLAN: r0=4(x), r1=131(y), r2=42(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 131
LDI r2, 42
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
