; DESCRIPTION: Draws a white rectangle at (77, 59) with width 87 and height 56.
; PLAN: r0=77(x), r1=59(y), r2=87(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 59
LDI r2, 87
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
