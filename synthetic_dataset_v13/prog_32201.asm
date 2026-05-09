; DESCRIPTION: Draws a magenta rectangle at (372, 92) with width 75 and height 111.
; PLAN: r0=372(x), r1=92(y), r2=75(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 92
LDI r2, 75
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
