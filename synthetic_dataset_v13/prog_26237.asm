; DESCRIPTION: Draws a white rectangle at (20, 27) with width 21 and height 33.
; PLAN: r0=20(x), r1=27(y), r2=21(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 27
LDI r2, 21
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
