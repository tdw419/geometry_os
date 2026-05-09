; DESCRIPTION: Draws a magenta rectangle at (63, 27) with width 63 and height 113.
; PLAN: r0=63(x), r1=27(y), r2=63(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 27
LDI r2, 63
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
