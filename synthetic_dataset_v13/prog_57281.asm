; DESCRIPTION: Draws a green rectangle at (262, 182) with width 81 and height 72.
; PLAN: r0=262(x), r1=182(y), r2=81(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 182
LDI r2, 81
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
