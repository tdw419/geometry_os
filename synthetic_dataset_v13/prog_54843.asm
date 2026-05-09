; DESCRIPTION: Draws a green rectangle at (208, 160) with width 13 and height 61.
; PLAN: r0=208(x), r1=160(y), r2=13(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 160
LDI r2, 13
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
