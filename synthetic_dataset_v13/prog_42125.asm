; DESCRIPTION: Draws a white rectangle at (139, 166) with width 75 and height 27.
; PLAN: r0=139(x), r1=166(y), r2=75(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 166
LDI r2, 75
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
