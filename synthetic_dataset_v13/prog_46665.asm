; DESCRIPTION: Draws a magenta rectangle at (30, 27) with width 64 and height 59.
; PLAN: r0=30(x), r1=27(y), r2=64(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 27
LDI r2, 64
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
