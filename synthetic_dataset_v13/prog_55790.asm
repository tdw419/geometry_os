; DESCRIPTION: Draws a green rectangle at (331, 94) with width 75 and height 61.
; PLAN: r0=331(x), r1=94(y), r2=75(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 94
LDI r2, 75
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
