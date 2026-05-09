; DESCRIPTION: Draws a magenta rectangle at (304, 1) with width 103 and height 77.
; PLAN: r0=304(x), r1=1(y), r2=103(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 1
LDI r2, 103
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
