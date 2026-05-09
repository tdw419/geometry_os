; DESCRIPTION: Draws a magenta rectangle at (388, 82) with width 115 and height 103.
; PLAN: r0=388(x), r1=82(y), r2=115(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 82
LDI r2, 115
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
