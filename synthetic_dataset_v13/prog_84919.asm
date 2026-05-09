; DESCRIPTION: Draws a red rectangle at (127, 141) with width 65 and height 115.
; PLAN: r0=127(x), r1=141(y), r2=65(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 141
LDI r2, 65
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
