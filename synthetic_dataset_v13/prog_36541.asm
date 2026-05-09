; DESCRIPTION: Draws a white rectangle at (413, 138) with width 98 and height 59.
; PLAN: r0=413(x), r1=138(y), r2=98(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 138
LDI r2, 98
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
