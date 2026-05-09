; DESCRIPTION: Renders a green disk with center (419, 120) and radius 16.
; PLAN: r0=419(x), r1=120(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 120
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
