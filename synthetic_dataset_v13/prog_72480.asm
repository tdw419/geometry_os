; DESCRIPTION: Draws a white rectangle at (190, 106) with width 91 and height 75.
; PLAN: r0=190(x), r1=106(y), r2=91(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 106
LDI r2, 91
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
