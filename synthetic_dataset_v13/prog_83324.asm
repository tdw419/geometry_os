; DESCRIPTION: Places a purple circle of radius 75 at center (373, 91).
; PLAN: r0=373(x), r1=91(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 91
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
