; DESCRIPTION: Draws a magenta rectangle at (280, 20) with width 53 and height 103.
; PLAN: r0=280(x), r1=20(y), r2=53(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 20
LDI r2, 53
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
