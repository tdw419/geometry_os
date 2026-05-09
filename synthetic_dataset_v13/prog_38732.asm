; DESCRIPTION: Draws a green rectangle at (417, 15) with width 47 and height 72.
; PLAN: r0=417(x), r1=15(y), r2=47(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 15
LDI r2, 47
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
