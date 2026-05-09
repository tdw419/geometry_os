; DESCRIPTION: Draws a red rectangle at (247, 125) with width 74 and height 94.
; PLAN: r0=247(x), r1=125(y), r2=74(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 125
LDI r2, 74
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
