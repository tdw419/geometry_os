; DESCRIPTION: Draws a magenta rectangle at (168, 116) with width 79 and height 73.
; PLAN: r0=168(x), r1=116(y), r2=79(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 116
LDI r2, 79
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
