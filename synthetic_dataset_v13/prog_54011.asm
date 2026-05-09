; DESCRIPTION: Draws a white rectangle at (59, 125) with width 102 and height 28.
; PLAN: r0=59(x), r1=125(y), r2=102(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 125
LDI r2, 102
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
