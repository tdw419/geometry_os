; DESCRIPTION: Draws a magenta rectangle at (465, 173) with width 23 and height 68.
; PLAN: r0=465(x), r1=173(y), r2=23(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 173
LDI r2, 23
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
