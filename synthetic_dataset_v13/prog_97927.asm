; DESCRIPTION: Renders a blue box of size 63x75 starting at (422, 157).
; PLAN: r0=422(x), r1=157(y), r2=63(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 157
LDI r2, 63
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
