; DESCRIPTION: Draws a cyan rectangle at (276, 97) with width 110 and height 83.
; PLAN: r0=276(x), r1=97(y), r2=110(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 97
LDI r2, 110
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
