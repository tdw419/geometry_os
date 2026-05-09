; DESCRIPTION: Draws a magenta rectangle at (405, 118) with width 76 and height 18.
; PLAN: r0=405(x), r1=118(y), r2=76(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 118
LDI r2, 76
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
