; DESCRIPTION: Draws a magenta rectangle at (392, 78) with width 86 and height 98.
; PLAN: r0=392(x), r1=78(y), r2=86(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 78
LDI r2, 86
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
