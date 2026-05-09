; DESCRIPTION: Renders a yellow disk with center (180, 110) and radius 36.
; PLAN: r0=180(x), r1=110(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 110
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
