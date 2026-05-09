; DESCRIPTION: Renders a purple disk with center (439, 83) and radius 57.
; PLAN: r0=439(x), r1=83(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 83
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
