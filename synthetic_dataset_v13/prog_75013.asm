; DESCRIPTION: Draws a white rectangle at (35, 131) with width 97 and height 65.
; PLAN: r0=35(x), r1=131(y), r2=97(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 131
LDI r2, 97
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
