; DESCRIPTION: Draws a white rectangle at (408, 159) with width 20 and height 31.
; PLAN: r0=408(x), r1=159(y), r2=20(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 159
LDI r2, 20
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
