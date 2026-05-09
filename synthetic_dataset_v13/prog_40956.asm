; DESCRIPTION: Draws a cyan rectangle at (116, 81) with width 86 and height 74.
; PLAN: r0=116(x), r1=81(y), r2=86(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 81
LDI r2, 86
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
