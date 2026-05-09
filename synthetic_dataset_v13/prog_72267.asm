; DESCRIPTION: Draws a cyan rectangle at (268, 31) with width 93 and height 118.
; PLAN: r0=268(x), r1=31(y), r2=93(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 31
LDI r2, 93
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
