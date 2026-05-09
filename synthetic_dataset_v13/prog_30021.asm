; DESCRIPTION: Draws a white rectangle at (195, 70) with width 44 and height 25.
; PLAN: r0=195(x), r1=70(y), r2=44(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 70
LDI r2, 44
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
