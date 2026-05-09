; DESCRIPTION: Places a purple circle of radius 55 at center (120, 192).
; PLAN: r0=120(x), r1=192(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 192
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
