; DESCRIPTION: Draws a magenta rectangle at (301, 111) with width 120 and height 45.
; PLAN: r0=301(x), r1=111(y), r2=120(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 111
LDI r2, 120
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
