; DESCRIPTION: Draws a magenta rectangle at (317, 244) with width 85 and height 12.
; PLAN: r0=317(x), r1=244(y), r2=85(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 244
LDI r2, 85
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
