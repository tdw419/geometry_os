; DESCRIPTION: Draws a orange rectangle at (391, 107) with width 36 and height 77.
; PLAN: r0=391(x), r1=107(y), r2=36(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 107
LDI r2, 36
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
