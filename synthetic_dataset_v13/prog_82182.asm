; DESCRIPTION: Draws a white rectangle at (89, 163) with width 116 and height 59.
; PLAN: r0=89(x), r1=163(y), r2=116(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 163
LDI r2, 116
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
