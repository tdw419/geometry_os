; DESCRIPTION: Renders a purple box of size 32x110 starting at (283, 1).
; PLAN: r0=283(x), r1=1(y), r2=32(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 1
LDI r2, 32
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
