; DESCRIPTION: Draws a magenta rectangle at (228, 24) with width 98 and height 119.
; PLAN: r0=228(x), r1=24(y), r2=98(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 24
LDI r2, 98
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
