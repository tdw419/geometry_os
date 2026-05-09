; DESCRIPTION: Draws a magenta rectangle at (465, 99) with width 45 and height 85.
; PLAN: r0=465(x), r1=99(y), r2=45(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 99
LDI r2, 45
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
