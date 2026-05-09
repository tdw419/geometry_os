; DESCRIPTION: Draws a magenta rectangle at (450, 9) with width 57 and height 16.
; PLAN: r0=450(x), r1=9(y), r2=57(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 9
LDI r2, 57
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
