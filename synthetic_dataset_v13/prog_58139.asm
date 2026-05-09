; DESCRIPTION: Draws a white rectangle at (10, 175) with width 91 and height 60.
; PLAN: r0=10(x), r1=175(y), r2=91(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 175
LDI r2, 91
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
