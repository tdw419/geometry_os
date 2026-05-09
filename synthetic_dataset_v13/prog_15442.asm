; DESCRIPTION: Draws a white rectangle at (91, 16) with width 80 and height 118.
; PLAN: r0=91(x), r1=16(y), r2=80(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 16
LDI r2, 80
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
