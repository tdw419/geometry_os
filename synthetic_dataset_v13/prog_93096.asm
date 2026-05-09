; DESCRIPTION: Draws a magenta rectangle at (175, 33) with width 109 and height 107.
; PLAN: r0=175(x), r1=33(y), r2=109(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 33
LDI r2, 109
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
