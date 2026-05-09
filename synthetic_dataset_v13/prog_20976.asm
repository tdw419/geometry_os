; DESCRIPTION: Draws a red rectangle at (107, 89) with width 98 and height 115.
; PLAN: r0=107(x), r1=89(y), r2=98(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 89
LDI r2, 98
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
