; DESCRIPTION: Draws a magenta rectangle at (374, 154) with width 61 and height 55.
; PLAN: r0=374(x), r1=154(y), r2=61(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 154
LDI r2, 61
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
