; DESCRIPTION: Renders a purple box of size 20x70 starting at (422, 138).
; PLAN: r0=422(x), r1=138(y), r2=20(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 138
LDI r2, 20
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
