; DESCRIPTION: Draws a green rectangle at (177, 74) with width 46 and height 56.
; PLAN: r0=177(x), r1=74(y), r2=46(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 74
LDI r2, 46
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
