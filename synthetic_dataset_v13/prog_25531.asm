; DESCRIPTION: Draws a magenta rectangle at (410, 74) with width 24 and height 102.
; PLAN: r0=410(x), r1=74(y), r2=24(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 74
LDI r2, 24
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
