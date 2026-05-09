; DESCRIPTION: Draws a cyan rectangle at (276, 114) with width 36 and height 35.
; PLAN: r0=276(x), r1=114(y), r2=36(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 114
LDI r2, 36
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
