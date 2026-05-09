; DESCRIPTION: Draws a red rectangle at (422, 105) with width 22 and height 28.
; PLAN: r0=422(x), r1=105(y), r2=22(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 105
LDI r2, 22
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
