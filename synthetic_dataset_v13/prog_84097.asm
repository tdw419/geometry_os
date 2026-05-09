; DESCRIPTION: Draws a magenta rectangle at (294, 45) with width 70 and height 67.
; PLAN: r0=294(x), r1=45(y), r2=70(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 45
LDI r2, 70
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
