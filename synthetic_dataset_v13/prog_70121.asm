; DESCRIPTION: Draws a green rectangle at (115, 44) with width 11 and height 61.
; PLAN: r0=115(x), r1=44(y), r2=11(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 44
LDI r2, 11
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
