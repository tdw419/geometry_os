; DESCRIPTION: Places a green circle of radius 16 at center (439, 145).
; PLAN: r0=439(x), r1=145(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 145
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
