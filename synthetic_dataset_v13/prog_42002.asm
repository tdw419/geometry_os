; DESCRIPTION: Draws a magenta rectangle at (370, 0) with width 99 and height 117.
; PLAN: r0=370(x), r1=0(y), r2=99(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 0
LDI r2, 99
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
