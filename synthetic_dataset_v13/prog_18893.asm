; DESCRIPTION: Draws a magenta rectangle at (285, 120) with width 61 and height 67.
; PLAN: r0=285(x), r1=120(y), r2=61(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 120
LDI r2, 61
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
