; DESCRIPTION: Draws a magenta rectangle at (199, 95) with width 32 and height 10.
; PLAN: r0=199(x), r1=95(y), r2=32(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 95
LDI r2, 32
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
