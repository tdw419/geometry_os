; DESCRIPTION: Draws a green rectangle at (56, 46) with width 76 and height 77.
; PLAN: r0=56(x), r1=46(y), r2=76(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 46
LDI r2, 76
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
