; DESCRIPTION: Draws a green rectangle at (380, 11) with width 44 and height 115.
; PLAN: r0=380(x), r1=11(y), r2=44(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 11
LDI r2, 44
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
