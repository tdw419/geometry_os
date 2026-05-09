; DESCRIPTION: Draws a red rectangle at (264, 182) with width 85 and height 53.
; PLAN: r0=264(x), r1=182(y), r2=85(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 182
LDI r2, 85
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
