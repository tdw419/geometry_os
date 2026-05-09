; DESCRIPTION: Draws a white rectangle at (68, 75) with width 59 and height 98.
; PLAN: r0=68(x), r1=75(y), r2=59(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 75
LDI r2, 59
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
