; DESCRIPTION: Draws a black rectangle at (133, 182) with width 79 and height 73.
; PLAN: r0=133(x), r1=182(y), r2=79(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 182
LDI r2, 79
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
