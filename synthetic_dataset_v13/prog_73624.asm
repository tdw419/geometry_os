; DESCRIPTION: Draws a magenta rectangle at (18, 23) with width 111 and height 93.
; PLAN: r0=18(x), r1=23(y), r2=111(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 23
LDI r2, 111
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
