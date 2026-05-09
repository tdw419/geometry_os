; DESCRIPTION: Draws a red rectangle at (226, 75) with width 37 and height 60.
; PLAN: r0=226(x), r1=75(y), r2=37(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 75
LDI r2, 37
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
