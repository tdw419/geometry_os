; DESCRIPTION: Draws a blue rectangle at (422, 38) with width 60 and height 48.
; PLAN: r0=422(x), r1=38(y), r2=60(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 38
LDI r2, 60
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
