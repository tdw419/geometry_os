; DESCRIPTION: Draws a magenta rectangle at (367, 74) with width 67 and height 10.
; PLAN: r0=367(x), r1=74(y), r2=67(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 74
LDI r2, 67
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
