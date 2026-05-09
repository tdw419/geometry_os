; DESCRIPTION: Draws a white rectangle at (50, 106) with width 115 and height 70.
; PLAN: r0=50(x), r1=106(y), r2=115(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 106
LDI r2, 115
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
