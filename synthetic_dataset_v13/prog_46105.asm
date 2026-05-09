; DESCRIPTION: Renders a blue box of size 20x37 starting at (422, 21).
; PLAN: r0=422(x), r1=21(y), r2=20(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 21
LDI r2, 20
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
