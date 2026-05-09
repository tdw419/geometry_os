; DESCRIPTION: Draws a white rectangle at (290, 96) with width 12 and height 23.
; PLAN: r0=290(x), r1=96(y), r2=12(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 96
LDI r2, 12
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
