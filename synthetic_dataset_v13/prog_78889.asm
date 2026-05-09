; DESCRIPTION: Draws a magenta rectangle at (325, 47) with width 52 and height 61.
; PLAN: r0=325(x), r1=47(y), r2=52(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 47
LDI r2, 52
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
