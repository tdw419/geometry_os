; DESCRIPTION: Draws a green rectangle at (320, 55) with width 77 and height 76.
; PLAN: r0=320(x), r1=55(y), r2=77(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 55
LDI r2, 77
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
