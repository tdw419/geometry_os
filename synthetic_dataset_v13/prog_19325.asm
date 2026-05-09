; DESCRIPTION: Draws a cyan rectangle at (116, 89) with width 118 and height 103.
; PLAN: r0=116(x), r1=89(y), r2=118(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 89
LDI r2, 118
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
