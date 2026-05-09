; DESCRIPTION: Draws a yellow rectangle at (427, 173) with width 75 and height 61.
; PLAN: r0=427(x), r1=173(y), r2=75(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 173
LDI r2, 75
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
