; DESCRIPTION: Draws a cyan rectangle at (316, 17) with width 107 and height 87.
; PLAN: r0=316(x), r1=17(y), r2=107(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 17
LDI r2, 107
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
