; DESCRIPTION: Draws a red rectangle at (373, 26) with width 40 and height 84.
; PLAN: r0=373(x), r1=26(y), r2=40(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 26
LDI r2, 40
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
