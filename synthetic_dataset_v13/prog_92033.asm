; DESCRIPTION: Draws a magenta rectangle at (206, 20) with width 120 and height 65.
; PLAN: r0=206(x), r1=20(y), r2=120(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 20
LDI r2, 120
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
