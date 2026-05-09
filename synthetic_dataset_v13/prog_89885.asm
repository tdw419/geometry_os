; DESCRIPTION: Draws a blue rectangle at (422, 63) with width 71 and height 47.
; PLAN: r0=422(x), r1=63(y), r2=71(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 63
LDI r2, 71
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
