; DESCRIPTION: Draws a red rectangle at (297, 177) with width 89 and height 27.
; PLAN: r0=297(x), r1=177(y), r2=89(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 177
LDI r2, 89
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
