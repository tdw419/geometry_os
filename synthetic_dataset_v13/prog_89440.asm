; DESCRIPTION: Draws a white rectangle at (251, 102) with width 87 and height 102.
; PLAN: r0=251(x), r1=102(y), r2=87(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 102
LDI r2, 87
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
