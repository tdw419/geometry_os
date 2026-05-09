; DESCRIPTION: Draws a yellow rectangle at (156, 38) with width 89 and height 113.
; PLAN: r0=156(x), r1=38(y), r2=89(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 38
LDI r2, 89
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
