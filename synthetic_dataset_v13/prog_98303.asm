; DESCRIPTION: Draws a white rectangle at (216, 59) with width 65 and height 77.
; PLAN: r0=216(x), r1=59(y), r2=65(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 59
LDI r2, 65
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
