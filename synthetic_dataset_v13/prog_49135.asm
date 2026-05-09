; DESCRIPTION: Draws a white rectangle at (400, 23) with width 99 and height 50.
; PLAN: r0=400(x), r1=23(y), r2=99(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 23
LDI r2, 99
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
