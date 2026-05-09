; DESCRIPTION: Draws a white rectangle at (5, 65) with width 59 and height 58.
; PLAN: r0=5(x), r1=65(y), r2=59(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 65
LDI r2, 59
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
