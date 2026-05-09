; DESCRIPTION: Places a purple circle of radius 37 at center (328, 50).
; PLAN: r0=328(x), r1=50(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 50
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
