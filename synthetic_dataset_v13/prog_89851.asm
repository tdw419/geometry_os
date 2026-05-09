; DESCRIPTION: Draws a green rectangle at (276, 39) with width 12 and height 90.
; PLAN: r0=276(x), r1=39(y), r2=12(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 39
LDI r2, 12
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
