; DESCRIPTION: Draws a white rectangle at (86, 56) with width 77 and height 21.
; PLAN: r0=86(x), r1=56(y), r2=77(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 56
LDI r2, 77
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
