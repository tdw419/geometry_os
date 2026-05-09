; DESCRIPTION: Renders a yellow disk with center (275, 38) and radius 25.
; PLAN: r0=275(x), r1=38(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 38
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
