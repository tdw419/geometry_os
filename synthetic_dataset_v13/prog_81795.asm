; DESCRIPTION: Draws a white rectangle at (75, 25) with width 87 and height 115.
; PLAN: r0=75(x), r1=25(y), r2=87(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 25
LDI r2, 87
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
