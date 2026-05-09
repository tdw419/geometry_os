; DESCRIPTION: Draws a magenta rectangle at (275, 27) with width 111 and height 63.
; PLAN: r0=275(x), r1=27(y), r2=111(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 27
LDI r2, 111
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
