; DESCRIPTION: Draws a red rectangle at (133, 182) with width 94 and height 26.
; PLAN: r0=133(x), r1=182(y), r2=94(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 182
LDI r2, 94
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
