; DESCRIPTION: Renders a purple box of size 87x17 starting at (278, 110).
; PLAN: r0=278(x), r1=110(y), r2=87(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 110
LDI r2, 87
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
