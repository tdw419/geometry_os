; DESCRIPTION: Draws a magenta rectangle at (38, 45) with width 86 and height 74.
; PLAN: r0=38(x), r1=45(y), r2=86(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 45
LDI r2, 86
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
