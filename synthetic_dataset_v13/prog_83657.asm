; DESCRIPTION: Draws a green rectangle at (238, 182) with width 79 and height 40.
; PLAN: r0=238(x), r1=182(y), r2=79(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 182
LDI r2, 79
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
