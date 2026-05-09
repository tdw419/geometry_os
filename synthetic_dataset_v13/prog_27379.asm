; DESCRIPTION: Draws a cyan rectangle at (77, 114) with width 14 and height 81.
; PLAN: r0=77(x), r1=114(y), r2=14(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 114
LDI r2, 14
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
