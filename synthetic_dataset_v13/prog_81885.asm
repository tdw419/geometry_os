; DESCRIPTION: Draws a cyan rectangle at (60, 89) with width 81 and height 102.
; PLAN: r0=60(x), r1=89(y), r2=81(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 89
LDI r2, 81
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
