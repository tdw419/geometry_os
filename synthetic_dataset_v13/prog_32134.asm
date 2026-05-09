; DESCRIPTION: Draws a cyan rectangle at (276, 114) with width 52 and height 108.
; PLAN: r0=276(x), r1=114(y), r2=52(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 114
LDI r2, 52
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
