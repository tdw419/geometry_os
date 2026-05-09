; DESCRIPTION: Draws a magenta rectangle at (298, 118) with width 70 and height 40.
; PLAN: r0=298(x), r1=118(y), r2=70(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 118
LDI r2, 70
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
