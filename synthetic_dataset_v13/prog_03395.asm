; DESCRIPTION: Draws a magenta rectangle at (202, 202) with width 89 and height 44.
; PLAN: r0=202(x), r1=202(y), r2=89(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 202
LDI r2, 89
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
