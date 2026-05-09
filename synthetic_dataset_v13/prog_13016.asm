; DESCRIPTION: Renders a blue disk with center (110, 190) and radius 14.
; PLAN: r0=110(x), r1=190(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 190
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
