; DESCRIPTION: Draws a white rectangle at (212, 153) with width 107 and height 71.
; PLAN: r0=212(x), r1=153(y), r2=107(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 153
LDI r2, 107
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
