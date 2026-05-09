; DESCRIPTION: Draws a magenta rectangle at (52, 173) with width 12 and height 27.
; PLAN: r0=52(x), r1=173(y), r2=12(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 173
LDI r2, 12
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
