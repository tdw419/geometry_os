; DESCRIPTION: Draws a cyan rectangle at (276, 132) with width 109 and height 17.
; PLAN: r0=276(x), r1=132(y), r2=109(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 132
LDI r2, 109
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
