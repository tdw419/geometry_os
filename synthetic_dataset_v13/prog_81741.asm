; DESCRIPTION: Draws a red rectangle at (153, 182) with width 94 and height 47.
; PLAN: r0=153(x), r1=182(y), r2=94(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 182
LDI r2, 94
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
