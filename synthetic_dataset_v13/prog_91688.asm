; DESCRIPTION: Draws a green rectangle at (373, 177) with width 117 and height 25.
; PLAN: r0=373(x), r1=177(y), r2=117(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 177
LDI r2, 117
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
