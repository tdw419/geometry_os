; DESCRIPTION: Draws a magenta rectangle at (370, 180) with width 70 and height 14.
; PLAN: r0=370(x), r1=180(y), r2=70(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 180
LDI r2, 70
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
