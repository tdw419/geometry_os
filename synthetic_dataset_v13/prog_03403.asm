; DESCRIPTION: Draws a magenta rectangle at (127, 151) with width 71 and height 42.
; PLAN: r0=127(x), r1=151(y), r2=71(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 151
LDI r2, 71
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
