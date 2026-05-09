; DESCRIPTION: Places a yellow circle of radius 17 at center (439, 152).
; PLAN: r0=439(x), r1=152(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 152
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
