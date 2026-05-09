; DESCRIPTION: Renders a green disk with center (468, 25) and radius 10.
; PLAN: r0=468(x), r1=25(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 25
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
