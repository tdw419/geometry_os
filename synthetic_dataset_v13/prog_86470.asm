; DESCRIPTION: Draws a white rectangle at (59, 77) with width 52 and height 86.
; PLAN: r0=59(x), r1=77(y), r2=52(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 77
LDI r2, 52
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
