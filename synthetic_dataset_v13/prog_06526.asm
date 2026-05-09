; DESCRIPTION: Draws a red rectangle at (127, 76) with width 34 and height 98.
; PLAN: r0=127(x), r1=76(y), r2=34(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 76
LDI r2, 34
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
