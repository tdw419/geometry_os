; DESCRIPTION: Draws a green rectangle at (236, 87) with width 117 and height 57.
; PLAN: r0=236(x), r1=87(y), r2=117(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 87
LDI r2, 117
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
