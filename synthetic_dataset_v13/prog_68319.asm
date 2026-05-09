; DESCRIPTION: Renders a green disk with center (439, 92) and radius 16.
; PLAN: r0=439(x), r1=92(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 92
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
