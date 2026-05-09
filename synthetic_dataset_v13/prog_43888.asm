; DESCRIPTION: Draws a magenta rectangle at (374, 12) with width 95 and height 66.
; PLAN: r0=374(x), r1=12(y), r2=95(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 12
LDI r2, 95
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
