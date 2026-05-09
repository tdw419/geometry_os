; DESCRIPTION: Draws a white rectangle at (280, 200) with width 39 and height 18.
; PLAN: r0=280(x), r1=200(y), r2=39(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 200
LDI r2, 39
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
