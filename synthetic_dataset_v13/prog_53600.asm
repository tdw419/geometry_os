; DESCRIPTION: Draws a blue rectangle at (422, 106) with width 21 and height 99.
; PLAN: r0=422(x), r1=106(y), r2=21(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 106
LDI r2, 21
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
