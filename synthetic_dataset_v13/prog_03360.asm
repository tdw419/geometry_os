; DESCRIPTION: Draws a red rectangle at (160, 66) with width 102 and height 44.
; PLAN: r0=160(x), r1=66(y), r2=102(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 66
LDI r2, 102
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
