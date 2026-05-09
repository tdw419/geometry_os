; DESCRIPTION: Draws a red rectangle at (186, 127) with width 61 and height 89.
; PLAN: r0=186(x), r1=127(y), r2=61(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 127
LDI r2, 61
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
