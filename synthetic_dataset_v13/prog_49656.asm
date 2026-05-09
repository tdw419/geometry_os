; DESCRIPTION: Draws a white rectangle at (283, 92) with width 91 and height 26.
; PLAN: r0=283(x), r1=92(y), r2=91(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 92
LDI r2, 91
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
