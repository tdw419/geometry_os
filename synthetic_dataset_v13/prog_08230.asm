; DESCRIPTION: Draws a red rectangle at (297, 127) with width 37 and height 115.
; PLAN: r0=297(x), r1=127(y), r2=37(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 127
LDI r2, 37
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
