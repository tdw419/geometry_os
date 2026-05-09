; DESCRIPTION: Draws a white rectangle at (59, 33) with width 27 and height 110.
; PLAN: r0=59(x), r1=33(y), r2=27(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 33
LDI r2, 27
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
