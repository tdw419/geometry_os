; DESCRIPTION: Draws a cyan rectangle at (304, 81) with width 92 and height 118.
; PLAN: r0=304(x), r1=81(y), r2=92(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 81
LDI r2, 92
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
