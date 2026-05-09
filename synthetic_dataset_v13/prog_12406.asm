; DESCRIPTION: Draws a white rectangle at (320, 86) with width 77 and height 87.
; PLAN: r0=320(x), r1=86(y), r2=77(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 86
LDI r2, 77
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
