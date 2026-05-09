; DESCRIPTION: Draws a magenta rectangle at (439, 1) with width 27 and height 78.
; PLAN: r0=439(x), r1=1(y), r2=27(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 1
LDI r2, 27
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
