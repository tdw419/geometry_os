; DESCRIPTION: Draws a magenta rectangle at (386, 119) with width 117 and height 112.
; PLAN: r0=386(x), r1=119(y), r2=117(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 119
LDI r2, 117
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
