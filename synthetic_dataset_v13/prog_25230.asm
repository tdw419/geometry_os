; DESCRIPTION: Draws a magenta rectangle at (259, 14) with width 95 and height 16.
; PLAN: r0=259(x), r1=14(y), r2=95(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 14
LDI r2, 95
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
